function scalp_plot(scalp_model , brain_model, electrodes , DATA)

%% The main function to plot our fancy scalp map with an underlying brain model
% Author: Claude Bajada (claude.bajada@um.edu.mt)
% Distributed under terms of the GPL v3.0 licence.
% 
% Use: scalp_plot(scalp_model , brain_model, electrodes , DATA)
% 
% scalp_model : a matlab structure that contains two fields delineating the scalp, "faces" and "vertices
% brain_model : same as above, delineating a (template) brain
% electrodes : a n x 3 array delineating the coordinates of the EEG electodes. MUST be in same space as scalp
% DATA : The data that maps onto the electode positions


check_structure(brain_model);
check_structure(scalp_model);
check_structure(DATA);

% capture the inferior most extent of scalp electrodes
electrodes_extent = min(electrodes(:,3));
non_scalp_vertics = scalp_model.vertices(:,3)<electrodes_extent;

% extract the data and interpolate it across the new grid
interpolated_data = extract_and_interpolate_data(scalp_model, non_scalp_vertics, electrodes , DATA);

% plot
final_plot(scalp_model , brain_model, interpolated_data)