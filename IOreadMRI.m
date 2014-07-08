function raw_image = IOreadMRI (filename, width, height)
	% raw_image = IOreadMRI (filename)
	% returns the data contained in a binary data file of complex(alternating real/imaginary) floats reshaped to the input dimensions
%check if valid file
fid = fopen(filename);
A = fread(fid,'float32','b');
fid = fclose(fid);
C = complex(A(1:2:length(A)),A(2:2:length(A)));
%check that reshape will work
if numel(C) ~= width*height
	largersmaller = 'smaller';
	if width*height > numel(C)
		largersmaller = 'larger';
	error(['Invalid dimensions for file.\nRequested a ' num2str(width) 'x' num2str(height) ' image, which is ' largersmaller ' than the number of complex elements in the file.');
end
raw_image = reshape(C,width,height);