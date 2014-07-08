function image = reconstructMRI (raw_image)
	% image = reconstructMRI (raw_image) 
	% returns the complex image in the same number of dimensions as the raw_image variable of the k-space via an inverse fourier transform
	image = fftshift(ifftn(raw_image));