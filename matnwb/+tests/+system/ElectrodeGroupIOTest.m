classdef ElectrodeGroupIOTest < tests.system.PyNWBIOTest
    methods
        function addContainer(testCase, file) %#ok<INUSL>
            % Device description is for pynwb compatibility
            dev = types.core.Device('description', 'dev1 description');
            file.general_devices.set('dev1', dev);
            eg = types.core.ElectrodeGroup( ...
                'description', 'a test ElectrodeGroup', ...
                'location', 'a nonexistent place', ...
                'device', types.untyped.SoftLink(dev));
            file.general_extracellular_ephys.set('elec1', eg);
        end
        
        function c = getContainer(testCase, file) %#ok<INUSL>
            c = file.general_extracellular_ephys.get('elec1');
        end
    end
end

