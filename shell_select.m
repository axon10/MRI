sub = 3
shell = 2000

dwifile = sprintf('sub%d/data_ud.nii.gz',sub)
bvals = sprintf('sub%d/bvals', sub)
bvecs = sprintf('sub%d/bvecs', sub)

DWI = MRIread(dwifile)
DWI_vol = DWI.vol;
bval = str2num(fileread(bvals));
bvec = str2num(fileread(bvecs));
sprintf('Originally had %d shells', length(bval))
b= find(bval< shell - 100 | bval > shell + 100);
DWI_vol(:,:,:,b) = [];
bval(b) = []
% transpose bvals
if size(bval, 2) == 1
    bval = bval'
end
% if bvecs is not transposed
if size(bvec,2) == 3
    bvec = bvec'
end
bvec(:,b)=[]
DWI.vol = DWI_vol;
MRIwrite(DWI,sprintf('sub%d/sub%d.nii', sub, sub));
sprintf('hi')
fprintf('%d shells removed with %d remaining', length(b), length(bval))
%bvalID = fopen(sprintf('sub%d.bval'sub1.bval', 'w')
format shortG
%fprintf(bvalID, '%.4f\n', bval)
dlmwrite(sprintf('sub%d/sub%d.bval',sub, sub),bval, 'delimiter', '\t')

%writematrix(bvec,'bvec_new.txt','Delimiter', 'space')
dlmwrite(sprintf('sub%d/sub%d.bvec',sub, sub),bvec, 'delimiter', '\t')
%save bvec_new.txt bvec -ascii 

