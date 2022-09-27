classdef VoltageClampStimulusSeries < types.core.PatchClampSeries & types.untyped.GroupClass
% VOLTAGECLAMPSTIMULUSSERIES Stimulus voltage applied during a voltage clamp recording.



methods
    function obj = VoltageClampStimulusSeries(varargin)
        % VOLTAGECLAMPSTIMULUSSERIES Constructor for VoltageClampStimulusSeries
        %     obj = VOLTAGECLAMPSTIMULUSSERIES(parentname1,parentvalue1,..,parentvalueN,parentargN,name1,value1,...,nameN,valueN)
        varargin = [{'data_conversion' types.util.correctType(1.0, 'float32') 'data_resolution' types.util.correctType(-1.0, 'float32') 'data_unit' 'volts'} varargin];
        obj = obj@types.core.PatchClampSeries(varargin{:});
        if strcmp(class(obj), 'types.core.VoltageClampStimulusSeries')
            types.util.checkUnset(obj, unique(varargin(1:2:end)));
        end
    end
    %% SETTERS
    
    %% VALIDATORS
    
    function val = validate_data(obj, val)
    
    end
    function val = validate_data_continuity(obj, val)
        val = types.util.checkDtype('data_continuity', 'char', val);
    end
    function val = validate_data_conversion(obj, val)
        val = types.util.checkDtype('data_conversion', 'float32', val);
    end
    function val = validate_data_resolution(obj, val)
        val = types.util.checkDtype('data_resolution', 'float32', val);
    end
    %% EXPORT
    function refs = export(obj, fid, fullpath, refs)
        refs = export@types.core.PatchClampSeries(obj, fid, fullpath, refs);
        if any(strcmp(refs, fullpath))
            return;
        end
    end
end

end