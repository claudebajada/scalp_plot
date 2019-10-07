function interpolated_data = extract_and_interpolate_data(scalp_model, non_scalp_vertics, electrodes , DATA)

% create mesh grid covering the coordinates of the brain
[xq,yq,zq] = meshgrid(-150:2:150, -150:2:150, -150:2:150);

% interpolate the values based on the 2D coordinates
vq = griddata(electrodes(:,1),electrodes(:,2),electrodes(:,3),DATA.cdata, xq,yq,zq);

% find values that are not NaN ie form part of the scalp
scalp_index = find(~isnan(vq));

% set as coordinates
coords(:,1) = xq(scalp_index);
coords(:,2) = yq(scalp_index);
coords(:,3) = zq(scalp_index);

% extract data as vector
extracted_data = vq(scalp_index);

% % scatter plot for santity check (uncomment to use)
% figure; scatter3(coords(:,1) , coords(:,2), coords(:,3)  , [] ,extracted_data);

% project new values onto original mesh (using knnsearch)
new_idx = knnsearch(coords , scalp_model.vertices);

% extract the colour map and turn to gifti for plotting
interpolated_data.cdata = extracted_data(new_idx);
interpolated_data.cdata(non_scalp_vertics) = nan;

