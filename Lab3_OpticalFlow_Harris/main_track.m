clear all
close all

sets = [["pingpong" "jpeg" "4" "52"]; ["person_toy" "jpg" "8" "104"]];
[nr_sets, ~] = size(sets);
save_frames = 1; % 1 for saving; 0 just for showing

for idx = 1:nr_sets
    close all
    cell1 = sets(idx,1);
    image_set_name = cell1{1};
    cell2 = sets(idx,2);
    image_ext = cell2{1};
    cell3 = sets(idx,3);
    name_0_padding = str2num(cell3{1});
    cell4 = sets(idx,4);
    image_range = str2num(cell4{1});
    
    tracking(image_set_name, image_ext, name_0_padding, image_range, save_frames)
end