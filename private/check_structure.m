function check_structure(STRUCTURE)

%% this function checks that the input is a valid and expected structure

if ~isstruct(STRUCTURE)
    error('The variable is invalid; needs to be a structure');
    
elseif all(isfield(STRUCTURE, {'faces' , 'vertices'}))
    true;
    
elseif isfield(STRUCTURE, 'cdata')
    true;
    
else
    error('not a recognised structure');
    
end



