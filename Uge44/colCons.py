#color_cons.py ver. 0.1 by Chrsitian Folsted
#color_cons.py ver. 0.2 by Soren Thirup
#colCons.py ver 0.3 by Soren Thirup

import colorsys,sys,os,math,string
from pymol import cmd

#  """
#    
#  AUTHOR 
#
#    Christian Brix Folsted Andersen & Søren Thirup
#
#
#  USAGE
#
#    This function colors a selection according to conservation in a specified alignment. The
#    alignment must be in the FASTA-format. Identical residues, partly conserved and not conserved residues
#    are colored according to the selected color scheme. The cutoff value specifies the degree of conservation required
#    for at residue to be classified as partly or fully conserved
#
#    From within PyMOL do "run color_cons.py" to load the function definition.  
#
#    In the pymol command line type
#
#    color_cons(selection='[selection to color]',
#    align='[path to file]',
#    ref=[position of reference sequence in alignment ],
#    start_res=[pdb number of first residue in alignment],
#    min=[0-1],
#    max=[0-1],
#    type= ['rain','shades','bin'],
#    cons=[color for identical residues],
#    none=[color for not conserved residues],
#    matrixfile = '[path to file]'
#    seqMaster = [True,False])
#
#    The following color schemes are used
#    rain: rainbow coloring of residues. blue (< min) to red (>max)
#    shades: shading from white (<min) to magenta (>max)
#    bin: colored using colors 'none' (<min) and 'cons' (>min)
#    Substitution matrix defaults to I. Only aminoacid substitution matrices are implemented.
#    The format of substitution matrix is as downloaded from ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/
#    seqMaster defines how to calculate the score: If true the conservation of the reference sequence is calculated
#    e.g. using the I matrix this will be the count of residues identical to the residue in the reference sequence normalised by the no. of sequences. 
#    If seqMaster False the score is the mean of the scores calculated looping over all sequences as reference sequence.
#
#    example:
#    color_cons('obj01','alignment.fasta',1,1,type='rain',matrixfile='BLOSUM62')
#  """

class Alignment:
  def __init__(self):
    self.sequences = []
    self.nseq = -1


  def load(self,file):
    print (file)
    alignfile = open(file,'r')

    for line in alignfile.readlines():
    #skip blank lines or lines starting with '>'
      if line[0:1] == '>':
#        print (self.nseq)
        self.nseq = self.nseq + 1
        self.sequences.append('')

        #save each line
      if (ord(line[0]) >= 65 and ord(line[0]) <= 122) or line[0] == '-':
#        print (self.nseq)
        self.sequences[self.nseq] = ''.join([self.sequences[self.nseq],line[0:-1]])

    #Close file
    alignfile.close()
    print ('Read ', self.nseq+1, 'sequences from', alignfile)
    return self.nseq+1

  def score(self,matrix,master,position):
    # here we calculate the score for an alignment position using the matrix
    # How exactly to do this needs to be decided
    
    # Set score for each residue in reference sequence
    # seq[master] is the reference sequence corresponding to the structure sequence from pymol
    # we will loop over all sequences

    s = 0
    aa = ' '

#   loop over all sequences at specified position
#    print ('score')
#    print (matrix)
    if master >= 0:
#      a master sequence is defined so calculate conservation of the master
      for i in range(len(self.sequences)):
#       if sequences are not padded with gaps at the end of alignment we may end out of bounds - so use try
        aamaster = make_uppercase(self.sequences[master][position])
        if aamaster == '-' : aamaster = '*'
        mati = matrix[0].index(aamaster)

        try:
          aa = make_uppercase(self.sequences[i][position])
        except:
          foo = "ba"
          matj = 23 # this only works for aa-sequences

        try:
          matj = matrix[0].index(aa)
        except:
          matj =22
        
        s = s + (matrix[mati+1][matj])
      
      s = s/((len(self.sequences))*(matrix[mati+1][mati]))
      return s
    elif master < 0:
      # no master defined so calculate conservation of this alignment position
      for i in range(len(self.sequences)):
        s = s + self.score(matrix,i,position)
      s = s/len(self.sequences)
      return s
        
  
  
  def seqlen(self,iseq):
    #returns the length of sequence no. iseq
    return len(self.sequences[iseq])
  
  def char(self,i,j):
    return self.sequences[i][j:j+1]

    
def make_uppercase(letter):
  if (ord(letter) >= 97 and ord(letter) <=122):
    return chr(ord(letter)-32)
  else:
    return letter

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# There is a problem with rain and shades when coloring several objects with different settings. In rain and shades the RGB assignment
# to colornames will affect previously colored objects which use the same colorname.

  
def rain():
  colnam = []
  rgb = []
  for i in range(101):
    colnam.append("rain"+str(i))
    if i <= 25:
    # range 1.0-0 1.0
      r = 0.0
      g = 0.0+float(i)/25.00
      b = 1.0
    elif i <= 50:
      r = 0.0
      g = 1.0
      b = 1.0 - float(i-25)/25.00
    elif i <= 75:
      r = 0.0 + float(i-50)/25.00
      g = 1.0
      b = 0.0
    else: 
      r = 1.0
      g = 1.0 - float(i-75)/25.0
      b = 0.0

    rgb = r,g,b
    cmd.set_color(colnam[i],rgb)
  return colnam


def shades(cons,none):
  colnam = []
  rgb = []
  indexcons = cmd.get_color_index(cons)
  rgbcons = cmd.get_color_tuple(indexcons)
  indexnone = cmd.get_color_index(none)
  rgbnone = cmd.get_color_tuple(none)

  diffr = rgbcons[0]-rgbnone[0]
  diffg = rgbcons[1]-rgbnone[1]
  diffb = rgbcons[2]-rgbnone[2]

  
  for i in range(101):
    colnam.append("shade"+str(i))
    # range 1.0-0 1.0
    r = rgbnone[0]+(float(diffr*i)/100.0)
    g = rgbnone[1]+(float(diffg*i)/100.00)
    b = rgbnone[2]+(float(diffb*i)/100.00)

    rgb = r,g,b
    cmd.set_color(colnam[i],rgb)
  return colnam

def color_cons(selection='all',align='',ref=1,start_res=1,min=0.0,max=1.0,type='rain',cons='green',none='white',matrixfile='I',seqMaster='True'):

  # make sure start_res and ref are integers
  start_res = int(start_res)
  ref = int(ref)

  #create and load an alignment from file
  alignm = Alignment()
  nseqs = alignm.load(align)
  print ('Alignment of', nseqs,'sequences loaded') 

  #open result file
  logfile = open(selection+'.log','w')

 
  # check input
  if nseqs < 2:
    print (os.linesep + "ERROR: An alignment of at least 2 sequences must be specified     -----> Terminating " + os.linesep)
    return

  if ref > nseqs or ref < 1:
    print (os.linesep + "ERROR: Reference assignment out of range    ----->   Terminating " + os.linesep)
    return

  # read substitution matrix
  matrix = loadMatrix(matrixfile)
  
  #declare scoring array
  score = []

  #declare ref_seq array
  ref_seq = []

  if type == 'rain': colname = rain()
  if type == 'shades': colname = shades(cons,none)

  #Set score for each residue in reference sequence
  if seqMaster:
    master = ref-1
  else:
    master = -1
  for j in range(alignm.seqlen(ref-1)):
    if alignm.char(ref-1,j) != '-':
      
      #done -  choose mode for calculation i.e.
      #1) conservation of the reference sequence/structure or
      #2) conservation of the alignment/structural position
      
      score.append(alignm.score(matrix,master,j))
      ref_seq.append(alignm.char(ref-1,j))

  consRange = float(max-min)
  fraction = 0
  for n in range(len(score)):
    if type != 'bin' :
      fraction = (score[n]-min)/consRange
      if fraction <= 0.0:
        fraction = 0.0
      if fraction >= 1.0:
        fraction = 0.99

      mycol = colname[int(fraction*100.0)]
      cmd.color(mycol, selection + " and resid " + str(n + start_res))
      
    elif type == 'bin':
      if float(score[n]) < min:
        cmd.color(none, selection + " and resid " + str(n + start_res))
      elif float(score[n]) >= min:
        cmd.color(cons, selection + " and resid " + str(n + start_res))
      

#      for n in range(len(score)):
#        if float(score[n])/float(len(seq)) < min:
#          cmd.color(none, selection + " and resid " + str(n + start_res))
#        elif float(score[n])/float(len(seq)) >= min:
#          cmd.color(cons, selection + " and resid " + str(n + start_res))

    logfile.write(str(ref_seq[n])+str(n + start_res)+' '+str(score[n]))
    logfile.write('\n')
    
  logfile.close
  
def loadMatrix(matrixfile='I'):
  
  matrix = []
  strNumbers = []
  iNumbers = []
  test = []
  if matrixfile == 'I':
    matrix.append(['A','R','N','D','C','Q','E','G','H','I','L','K','M','F','P','S','T','W','Y','V','B','Z','X','*'])
    for i in range(1,24):
      matrix.append([])
      for j in range(24):
        matrix[i].append(0)
        if j == i-1:
          matrix[i][j] = 1
  else:
    header = False
    nline = 0
    file = open(matrixfile,'r')
    for line in file.readlines():
      if line[0] != '#':
        if header == False:
          header = True
          test = line.split()
          matrix.append(test)
        else:
          nline = nline+1
          matrix.append([])
          strNumbers = line.split()
          iNumbers[:] = []

          for i in range(1,len(strNumbers)):
            matrix[nline].append(int(strNumbers[i]))
            #iNumbers.append(int(strNumbers[i]))

  return matrix
# allow calling without parentheses: color_hist_b [selection=], [mode= ],[gradient= ],[nbins= ]

cmd.extend("color_cons",color_cons)


