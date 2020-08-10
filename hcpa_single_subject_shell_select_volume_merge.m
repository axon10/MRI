shell = 3000;

subjects=dir('/rri_disks/velleda/chen_lab/ahan/hcpa');
subjects=subjects([subjects.isdir])

merge_encoding(0,subjects(525).name(4:end-6));
merge_encoding(1,subjects(525).name(4:end-6));

function DWI_vol = merge_encoding(x, sub)
    % if x is 0, merge the encodings of PA. Else, merge encodings
    % of AP (default)
    
    vol98 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir98_AP.nii.gz',sub, sub);
    vol99 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir99_AP.nii.gz', sub, sub);

    bvals98 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir98_AP.bval', sub, sub)
    bvals99 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir99_AP.bval', sub, sub)
    bvecs98 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir98_AP.bvec', sub, sub)
    bvecs99 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir99_AP.bvec', sub, sub)
    
    if x == 0
        vol98 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir98_PA.nii.gz',sub, sub);
        vol99 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir99_PA.nii.gz', sub, sub);
        
        bvals98 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir98_PA.bval', sub, sub)
        bvals99 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir99_PA.bval', sub, sub)
        bvecs98 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir98_PA.bvec', sub, sub)
        bvecs99 = sprintf('../hcpa/HCA%s_V1_MR/HCA%s_V1_MR_dMRI_dir99_PA.bvec', sub, sub)
    end
    % read in first vol    
    vol_1 = MRIread(vol98)
    DWI_vol = vol_1.vol;
    bval_1 = str2num(fileread(bvals98));
    bvec_1 = str2num(fileread(bvecs98));
    % read in second vol
    vol_2 = MRIread(vol99);
  
    bval_2 = str2num(fileread(bvals99));
    bvec_2 = str2num(fileread(bvecs99));
    
    %sprintf('Originally had %d shells', length(bval_1));
    
    shell = 3000;

    b_1_unwanted= find((bval_1 < shell - 100 | bval_1 > shell + 100) & bval_1 >= 100) ;
    b_2_wanted=find((bval_2 > shell - 100 & bval_2 < shell + 100) | bval_2 <= 100); 
    DWI_vol(:,:,:,b_1_unwanted) = [];
    DWI_vol;
    % concatenate replace with the wanted volumes @ the first volume
    DWI_vol(:,:,:,size(DWI_vol,4)+1:size(DWI_vol,4)+length(b_2_wanted)) = vol_2.vol(:,:,:,b_2_wanted);
    %DWI_vol = [DWI_vol vol_2.vol(:,:,:,b_2_wanted)];
    % update bvals, to the first bval
    bval_1(b_1_unwanted) = [];
    bval = [bval_1 bval_2(b_2_wanted)];
    
    % update bvecs
    bvec_1(:, b_1_unwanted) = [];
    bvec = [bvec_1 bvec_2(:,b_2_wanted)];
    
    % transpose bvals
    if size(bval, 2) == 1
        bval = bval';
    end
    % transpose bvecs
    if size(bvec,2) == 3
        bvec = bvec';
    end
    
    %save volume as original
    vol_1.vol = DWI_vol;
    vol_1.nframes = size(DWI_vol, 4)
    
    format shortG
    if x == 0
        sprintf(sub)
        MRIwrite(vol_1,sprintf('../hcpa/HCA%s_V1_MR/HCA%s_PA.nii', sub,sub));
        
        dlmwrite(sprintf('../hcpa/HCA%s_V1_MR/HCA%s_PA.bval',sub,sub),bval, 'delimiter', '\t');
        sprintf(sub)
        dlmwrite(sprintf('../hcpa/HCA%s_V1_MR/HCA%s_PA.bvec',sub,sub),bvec, 'delimiter', '\t');
        %bvalID = fopen(sprintf('sub%d.bval'sub1.bval', 'w')
        %fprintf(bvalID, '%.4f\n', bval)
        %writematrix(bvec,'bvec_new.txt','Delimiter', 'space')

    else
        MRIwrite(vol_1,sprintf('../hcpa/HCA%s_V1_MR/HCA%s_AP.nii.gz', sub, sub));
        dlmwrite(sprintf('../hcpa/HCA%s_V1_MR/HCA%s_AP.bval',sub, sub),bval, 'delimiter', '\t');
        dlmwrite(sprintf('../hcpa/HCA%s_V1_MR/HCA%s_AP.bvec',sub, sub),bvec, 'delimiter', '\t');
        %bvalID = fopen(sprintf('sub%d.bval'sub1.bval', 'w')
        %fprintf(bvalID, '%.4f\n', bval)
        %writematrix(bvec,'bvec_new.txt','Delimiter', 'space')
        %save bvec_new.txt bvec -ascii 
    end
end