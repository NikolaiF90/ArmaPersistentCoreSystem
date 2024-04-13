class persistentMenu
{
	idd = 1100;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Hotoqu)
		////////////////////////////////////////////////////////

		class RscText_1000: RscText
		{
			idc = 1101;

			x = 0.005 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0.071,0.239,0.11,1};
		};
		class listBox_saveList: RscListBox
		{
			idc = 1102;

			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0.235,0.388,0.306,1};
		};
		class button_save: RscButton
		{
			idc = 1103;
			action = "[] call F90_fnc_saveToSlot";

			text = "Save"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.235,0.388,0.306,1};
			tooltip = "Save progress to selected slot"; //--- ToDo: Localize;
		};
		class button_load: RscButton
		{
			idc = 1104;
			action = "[] call F90_fnc_loadFromSlot";

			text = "Load"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.235,0.388,0.306,1};
			tooltip = "Load progress from selected slot"; //--- ToDo: Localize;
		};
		class button_delete: RscButton
		{
			idc = 1105;
			action = "[] call F90_fnc_deleteSlot";

			text = "Delete"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.569,0.059,0.059,1};
			tooltip = "Delete selected slot"; //--- ToDo: Localize;
		};
		class text_scenarioName: RscText
		{
			idc = 1106;

			text = "Scenario Name"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.235,0.388,0.306,1};
		};
		class button_saveVehicle: RscButton
		{
			idc = 1107;
			action = "[] call F90_fnc_saveTarget";

			text = "Save Vehicle"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.141,0.38,0.184,1};
			tooltip = "Save the vehicle you're looking at"; //--- ToDo: Localize;
		};
		class button_saveContainer: RscButton
		{
			idc = 1108;
			action = "[] call F90_fnc_saveTargetContainer";

			text = "Save Container"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.141,0.38,0.184,1};
			tooltip = "Caution! Must point at container first."; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
		/* #Hotoqu
		$[
			1.063,
			["persistentMenu",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
			[1000,"RscText_1000",[1,"",["0.005 * safezoneW + safezoneX","0.00500001 * safezoneH + safezoneY","0.299062 * safezoneW","0.44 * safezoneH"],[-1,-1,-1,-1],[0.071,0.239,0.11,1],[-1,-1,-1,-1],"","-1"],["idc = 1101;"]],
			[1001,"listBox_saveList: RscListBox",[1,"",["0.0153125 * safezoneW + safezoneX","0.071 * safezoneH + safezoneY","0.195937 * safezoneW","0.341 * safezoneH"],[-1,-1,-1,-1],[0.235,0.388,0.306,1],[-1,-1,-1,-1],"","-1"],["idc = 1102;"]],
			[1600,"button_save",[1,"Save",["0.216406 * safezoneW + safezoneX","0.071 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.235,0.388,0.306,1],[-1,-1,-1,-1],"Save progress to selected slot","-1"],["idc = 1103;","action = |[] call F90_fnc_saveToSlot|;"]],
			[1601,"button_load",[1,"Load",["0.216406 * safezoneW + safezoneX","0.115 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.235,0.388,0.306,1],[-1,-1,-1,-1],"Load progress from selected slot","-1"],["idc = 1104;","action = |[] call F90_fnc_loadFromSlot|;"]],
			[1602,"button_delete",[1,"Delete",["0.216406 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.569,0.059,0.059,1],[-1,-1,-1,-1],"Delete selected slot","-1"],["idc = 1105;","action = |[] call F90_fnc_deleteSlot|;"]],
			[1002,"text_scenarioName",[1,"Scenario Name",["0.0153125 * safezoneW + safezoneX","0.027 * safezoneH + safezoneY","0.273281 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.235,0.388,0.306,1],[-1,-1,-1,-1],"","-1"],["idc = 1106;"]],
			[1603,"button_saveVehicle",[1,"Save Vehicle",["0.216406 * safezoneW + safezoneX","0.159 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.141,0.38,0.184,1],[-1,-1,-1,-1],"Save the vehicle you're looking at","-1"],["idc = 1107;","action = |[] call F90_fnc_saveTarget|;"]],
			[1604,"button_saveContainer",[1,"Save Container",["0.216406 * safezoneW + safezoneX","0.203 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.141,0.38,0.184,1],[-1,-1,-1,-1],"Caution! Must point at container first.","-1"],["idc = 1108;","action = |[] call F90_fnc_saveTargetContainer|;"]],
			[1605,"",[1,"Save Unit",["0.216406 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.141,0.38,0.184,1],[-1,-1,-1,-1],"Save the unit you're looking at.","-1"],["idc = 1108;","action = |[] call F90_fnc_saveTargetContainer|;"]]
		]
		*/
	};
};

