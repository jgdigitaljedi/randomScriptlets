
#!/usr/bin/python
import os
import shutil

rootdir = '/home/digitaljedi/code/test/src'
outdir = '/home/digitaljedi/code/test/result'
outdir2 = '/home/digitaljedi/code/test/result'
ext = '.gen'
ext2 = '.32x' #in case your directory has multiple rom types
suffix_arr = ['(U) [!]', '(U)', '(U) [f2]', '(U) [f1]', '(U) [h2C]', '(U) [h2]', '(U) [h1C]', '(U) [h1]', 
'(UE) [!]', '(UE)', '(UE) [f2]', '(UE) [f1]', '(UE) [h2C]', '(UE) [h2]', '(UE) [h1C]', '(UE) [h1]',
'(JUE) [!]', '(JUE)', '(JUE) [f2]', '(JUE) [f1]', '(JUE) [h2C]', '(JUE) [h2]', '(JUE) [h1C]', '(JUE) [h1]',
'(E) [!]', '(E)', '(E) [f2]', '(E) [f1]', '(E) [h2C]', '(E) [h2]', '(E) [h1C]', '(E) [h1]',
'(JE) [!]', '(JE)', '(JE) [f2]', '(JE) [f1]', '(JE) [h2C]', '(JE) [h2]', '(JE) [h1C]', '(JE) [h1]',
'(W) [!]', '(W)', '(W) [f2]', '(W) [f1]', '(W) [h2C]', '(W) [h2]', '(W) [h1C]', '(W) [h1]',
'(W) (M2) [!]', '(W) (M2)', '(W) (M2) [f2]', '(W) (M2) [f1]', '(W) (M2) [h2C]', '(W) (M2) [h2]', '(W) (M2) [h1C]', '(W) (M2) [h1]',
'(W) (M3) [!]', '(W) (M3)', '(W) (M3) [f2]', '(W) (M3) [f1]', '(W) (M3) [h2C]', '(W) (M3) [h2]', '(W) (M3) [h1C]', '(W) (M3) [h1]',
'(W) (M4) [!]', '(W) (M4)', '(W) (M4) [f2]', '(W) (M4) [f1]', '(W) (M4) [h2C]', '(W) (M4) [h2]', '(W) (M4) [h1C]', '(W) (M4) [h1]',
'(W) (M5) [!]', '(W) (M5)', '(W) (M5) [f2]', '(W) (M5) [f1]', '(W) (M5) [h2C]', '(W) (M5) [h2]', '(W) (M5) [h1C]', '(W) (M5) [h1]',
'(W) (M6) [!]', '(W) (M6)', '(W) (M6) [f2]', '(W) (M6) [f1]', '(W) (M6) [h2C]', '(W) (M6) [h2]', '(W) (M6) [h1C]', '(W) (M6) [h1]',
'(Beta) [!]', '(Beta)', '(Beta) [f2]', '(Beta) [f1]', '(Beta) [h2C]', '(Beta) [h2]', '(Beta) [h1C]', '(Beta) [h1]'
'(Unl) [!]', '(Unl)', '(Unl) [f2]', '(Unl) [f1]', '(Unl) [h2C]', '(Unl) [h2]', '(Unl) [h1C]', '(Unl) [h1]',
'(A) [!]', '(A)', '(A) [f2]', '(A) [f1]', '(A) [h2C]', '(A) [h2]', '(A) [h1C]', '(A) [h1]',
'(PD) [!]', '(PD)', '(PD) [f2]', '(PD) [f1]', '(PD) [h2C]', '(PD) [h2]', '(PD) [h1C]', '(PD) [h1]',
'(R) [!]', '(R)', '(R) [f2]', '(R) [f1]', '(R) [h2C]', '(R) [h2]', '(R) [h1C]', '(R) [h1]',
'(J) [!]', '(J)', '(J) [f2]', '(J) [f1]', '(J) [h2C]', '(J) [h2]', '(J) [h1C]', '(J) [h1]',
'(Ch) [!]', '(Ch)', '(Ch) [f2]', '(Ch) [f1]', '(Ch) [h2C]', '(Ch) [h2]', '(Ch) [h1C]', '(Ch) [h1]']

def rom_checker(files):
	for suff in suffix_arr:
		for file in files:
			if file.lower().endswith(suff.lower() + ext.lower()):
				print 'copied ' + file
				shutil.copy(os.path.join(root, file), outdir)
				return
			elif file.lower().endswith(suff.lower() + ext2.lower()):
				print 'copied ' + file
				shutil.copy(os.path.join(root, file), outdir2)
				return
	

for root, dirnames, filenames in os.walk(rootdir):
		rom_checker(filenames)
