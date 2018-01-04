import multiprocessing
import string
import subprocess

C7eq = {'phi':-161.7, 'psi':175.1, 'theta':-13.5, 'zeta':4.0}
C7ax = {'phi':78.3, 'psi':-59.8, 'theta':2.9, 'zeta':1.9}

def run_image(image_idx, num_images, bincoord_fname=None):
	'''Run an image constrained to the correct collective variables.
	'''
	if not bincoord_fname:
		bincoord_fname = 'alad_%02d.coor' % (image_idx - 1)
	# Prepare the NAMD input files
	with open('colvars.template', 'r') as fhandle:
		colvars = string.Template(fhandle.read())
	image = {}
	factor = float(image_idx) / num_images
	for key in C7eq.keys():
		image[key] = (1 - factor) * C7eq[key] + factor * C7ax[key]
	colvars = colvars.substitute(**image)
	with open('colvars_%02d.conf' % image_idx, 'w') as fhandle:
		fhandle.write(colvars)
	with open('alad_namd.template', 'r') as fhandle:
		namd = string.Template(fhandle.read())
	namd = namd.safe_substitute(colvars_fname='colvars_%02d.conf' % image_idx,
					output_fname='alad_%02d' % image_idx,
					num_steps=10000, num_stages = 10,
					swarms_force_constant=0.3,
					bincoord_fname=bincoord_fname)
	with open('alad_%02d.namd' % image_idx, 'w') as fhandle:
		fhandle.write(namd)
	proc = subprocess.Popen('namd2 alad_%02d.namd > alad_%02d.log' % (image_idx, image_idx), shell=True)
	return proc.wait()

if __name__ == "__main__":
	for idx in range(20):
		print "Running %d" % idx
		if idx == 0:	
			run_image(idx, 20, 'alad.coor')
		else:
			run_image(idx, 20)
