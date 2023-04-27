package SkyzerModel_v2{
    package Documentation{
        /*
        * use this package to document change history
        * ran with SysML v2 pilot implementation release 2023-02
        * 2023-04-23 initial Skyzer Mission Model
        * 2023-04-24 review initial model with team, remove short name and add number to name with quotes
        * 2023-04-26 established initial baseline Skyzer Mission Model 
        * Still not fully populated, some repreentative examples included for the following
        - requirement shall statement (doc)
        - requirements traceability relationships (dependencies)
        - swin lanes (perform actions)
        - use case to actors (actor feature of use case)
        - control flows between actions (successions)
        - flows on black box (itemscaptured, connector with messages in both directions)
        - satisfy relationship between requirements and Mission MOEs
        - some figures corresponding to selected diagrams
        */
    }
    package <'QC'> QualityChecks{}
    package SkyzerMissionModel_transformed{
        import '0.MissionStatement'::*;
        import '1.MissionRequirements'::*;
        import '2.MissionStructure'::*;
        import '3.MissionUseCases'::*;
 
        package '0.MissionStatement'{
            import MissionCapabilityArea::*;
            import '2.MissionStructure'::*;
            package MissionCapabilityArea{
                part def CCC {
                    doc /* C3 : Command, Control and Communication - 
                    The exercise of authority and direction by a properly designated commander 
                    over assigned and attached forces in the accomplishment of the mission.  
                    C3 function are performed through an arrangement of personnel, equipment, 
                    communications, facilities, and procedures employed by a commander in 
                    planning, directing, coordinating, and controlling forces and operations 
                    in the accomplishment of the mission.
                    */
                }
                part def MOS {
                    doc /* Mobility - A quality or capability of military forces which permits 
                    them to move from place to place while retaining the ability to fulfill 
                    their primary mission.
                    */
                }
                part def MCO {
                    doc /* Selected operations of a noncombat nature not clearly categorized 
                    in any other warfare mission area.  Included in this category are the 
                    necessary support requirements and/or special mission that are required 
                    of a unit, but not directly related to the other warfare mission areas.
                    */
                }
            }
            package OV_1{
                package legendProperties{
                    // map to a rendering method
                }
                dependency from AirVehicle to AreaOfInterest;
                dependency from AirVehicle to LocalFirstResponders;
                dependency from AirVehicle to LostCivilian;
                dependency from ControlStation to AirVehicle;
                dependency from ControlStation to NavyShip;
                dependency from RecoverySystem to NavyShip;
                dependency from Satellite to AirVehicle;
                dependency from SkyzerTeam to ControlStation; 
                dependency from Weather to AirVehicle;
            }
            package StakeholderConcerns{
                comment /*Compatibility*/
                comment /*Cost*/
                comment /*Ergonomics*/
                comment /*Flexibility*/
                comment /*Logicstics*/
                comment /*Maintainability*/
                comment /*MissionPerformance*/
                comment /*Responsiveness*/
                comment /*Safety*/
                comment /*Survival*/
            }
        }
        package '1.MissionRequirements'{
            import '1.0.MissionRequirements'::*;
            import '1.1.OperationalRequirements'::*;
            package '1.0.MissionRequirements'{
                requirement def Airworthiness;
                requirement def ImagingCapability{
                    requirement def ImageProcessing;
                }
                requirement def UAS_ControlSegment;
                requirement def UAV_Capabilities{
                    requirement def HumanSearchAndRescueWithUAV;
                    requirement def UAV_AutonomousFlying;
                    requirement def UAV_AutonomousLanding;
                    requirement def UAV_FlyPatterns;
                    requirement def UAVHighSeaStatesOperations;
                    requirement def UAVLandingAndRecoverInHighSeatStates;
                    requirement def UAV_LaunceAndLandingAreas;
                    requirement def UAV_OperationalPeriod;
                    requirement def UAV_TransmissionBandwidth;
                }
            } 
            package '1.1.OperationalRequirements'{
                requirement def CommunicationsCapability{
                    requirement def Multiple_UAV_GroundControlStation_Deleted;
                }
                requirement def ImagingCapability{
                    doc /* The system shall perform various imaging capabilities for search and rescue*/
                    requirement def ImageProcessing{
                        doc /* Ground Control to have image-processing capabilities to support identifying 
                        locations, lost personnel, and drop locations for search and rescue */
                    }
                    requirement def ImageExploitation{
                        doc /* Ground Control to have image-exploitation capabilities to support imagery 
                        mapping and seeking capabilities */
                    }
                }
                requirement def SurveillanceCapability{
                    requirement def HumanSearchAndRescueWithUAV{
                        doc /* The system shall use UAV to locate people during search and rescue missions 
                        with use of  payloads, full motion video */
                    }
                }
                requirement def UAV_Capability{
                    requirement def UAV_AutonomousFlying;
                    requirement def UAV_AutonomousLaunchAndRecover{
                        requirement def UAV_LaunchAndLandingAreas;
                        requirement def UAV_LaunchAndRecoverInHighSeaStates;
                    }
                    requirement def UAV_FlyPaterns;
                    requirement def UAV_HoverCapabilities;
                    requirement def UAV_OperationPeriod;
                    requirement def UAV_TransmissionBandwidth;
                }
            }
            package '1.2.FunctionalRequirements'{
                package <'1.2.1'> SkyzerSystemFunctionalRequirements{
                    requirement def UAV_AutonomousLanding;
                    requirement def MidflightPayloadDispersal;
                    requirement def OperationalLife;
                    requirement def ShipCOmpatibility;
                    requirement def UAV_Capability;
                    requirement def UAV_HighSea_States_Operations;
                    requirement def UAV_LandingAndRecoverInHighSeatStates;
                }
                package <'1.2.2'> UAV_FunctionalRequirement{
                    requirement def UAV_FlyPatterns;
                    requirement def AutonomouslyExecuteLostLinkFlightPlanIfGroundStationCommunicationSevered;
                    requirement def AutonomouslyHomeOn406MgzBeaconToLocateDistressedVesselOrIndividual;
                    requirement def AutonomouslyHoverAtCommandePosition;
                    requirement def AutonomouslyLoiterAtCommandedPosition;
                    requirement def AutonomouslyNavigateToSeaarchAreaSpecifiedInMissionPlan;
                    requirement def AutonomouslyNavigateToShipRecoverHoldPosition;
                    requirement def FlyAUtonomously;
                }
                package <'1.2.3'> LaunchRecoverySystemFunctionalInterface{
                    requirement def 'Disengage RAST restraint';
                    requirement def 'Engage RAST restraint';
                    requirement def 'Follow UCARS direction from hold position to ship';
                    requirement def 'Follow UCARS direction from ship to Hold Position';
                    requirement def 'Land on a ship under UCARS direction';
                    requirement def 'Take off from a ship under UCARS direction';
                }
                package <'1.2.4'> GroundStationFunctionalInterface{
                    requirement def 'Acknowledge receipt of ground station commands';
                    requirement def 'Communicate via LOS or BLOS depending on the distance from ground station';
                    requirement def 'Communication Range';
                    requirement def 'Execute ground station commands';
                    requirement def 'Image Resolution';
                    requirement def 'Power down on command of ground station';
                    requirement def 'Power down on ground crew emergency shut off';
                    requirement def 'Power up on command of ground station';
                    requirement def 'Receive ground station commands';
                    requirement def 'Receive ground station mission plan';
                    requirement def 'Relay distressed vessel/ individual VHF communication to ground station';
                    requirement def 'Report execution of ground station commands';
                    requirement def 'Store ground station mission plan';
                    requirement def 'Transmission Quality';
                    requirement def 'Transmit current position to ground station';
                    requirement def 'Transmit video or still images to ground station';
                    requirement def 'UAV Transmission Bandwidth';
                }
            }
            package '1.3.PerformanceRequirements'{
                requirement def 'Cruise Speed';
                requirement def 'Max Payload Weight';
                requirement def 'Max Speed';
                requirement def 'Operational Altitude';
                requirement def 'Operational Radius';
                requirement def 'Recovery Condition';
                requirement def 'UAV Operation Period';
            }
            package '1.4.DesignConstraints'{
                requirement def 'Airworthiness';
                requirement def 'Corrosion Resistance';
                requirement def 'Environmental Constraints'{
                    requirement def 'Visibility';
                    requirement def 'Icing';
                    requirement def 'Sea States';
                    requirement def 'Wind';
                }
                requirement def 'Fuel Type';
                requirement def 'Operational Bounding Box';
                requirement def 'Payload'{
                    requirement def 'Long Range Mission';
                    requirement def 'Short Range Mission';
                }
                requirement def 'Technology Readiness Level';
                requirement def 'UAV Launch and Landing Areas';
                requirement def 'UAV Payload Loading/Unloading';
                requirement def 'Weight';
            }
            package '1.5.RequirementsTraceability'{
                import '1.1.OperationalRequirements'::*;
                package RequirementsTraceability_OperationalToMission{
                    dependency from ImagingCapability to '1.0.MissionRequirements'::ImagingCapability;
                    dependency from ImagingCapability to '1.0.MissionRequirements'::ImagingCapability::ImageProcessing; 
                    dependency from ImagingCapability::ImageProcessing to '1.0.MissionRequirements'::ImagingCapability; 
                    dependency from ImagingCapability::ImageExploitation to '1.0.MissionRequirements'::ImagingCapability; 
                }
            }
        }
        package '2.MissionStructure'{
            import '4.MissionBehavior'::*;
            import SearchAndRescueDomain::*;
            package SearchAndRescueDomain{
                part def AirForce;
                part def DistressSailBoat{
                    part epirb:EPIRB_PLB;
                }
                part def Floater{
                    part epirb:EPIRB_PLB;
                }
                part def MissionCommander;
                part def Payload;
                part def RescueCoordinator;
                part def SearchAndRescueDomain{
                    part airforce: AirForce;
                    part navyShip: NavyShip;
                    part target: Target;
                    part dod: DOD;
                    part satellite: Satellite;
                    part skyzerSystem: SkyzerSystem;
                }
                part def ShipUtilities;
            }
            part def AirVehicle{
                @Icon{
                    // the following does not parse
                    smallImage = image1;
                }
            }
            part def AreaOfInterest;
            part def ControlStation;
            part def DDG_ClassShip{
                part shipUtilities:ShipUtilities;
                use case prepareForSAR:ConductSAR::PrepareForSAR;
            }
            part def DOD;
            part def Environment{
                part weather:Weather;
            }
            part def Facilities;
            part def GPS_Satellite{
                use case executeMission:ExecuteMission;
            }
            part def GroundCrew;
            part def LittoralCombatShip;
            part def LocalFirstResponders;
            part def LostCivilian;
            part def MaintenanceTeam;
            part def Navy{
                part navyShip:NavyShip;
            }
            part def NavyShip{
                part groundCrew: GroundCrew;
                part ddg_ClassShip: DDG_ClassShip;
                part rescueCoordinator:RescueCoordinator;
                part missionCommander:MissionCommander;
                use case loadMissioNPayload:LoadMissionPayload;
                use case executeAirVehiclePreFlight: ExecuteAirVehiclePreFlight ;
                use case transferAirVehicleToFlightDeck:TransferAirVehicleToFlightDeck;
                use case finalizeMission:FinalizeMission;
            }
            part def OperationalEnvironment{
                part maintenanceTeam:MaintenanceTeam;
                part skyzerTeam:SkyzerTeam;
                part trainingTeam:TrainingTeam;
                part supportTeam:SupportTeam;
                part facilities:Facilities;
            }
            part def RAST;
            part def RecoverySystem{
                part rast:RAST;
                part ucars:UCARS;
            }
            part def Satellite{
                part inmarSat:INMARSAT;
                part gps_Satellite:GPS_Satellite;
            }
            part def SkyzerMissionDomain{
                part skyzerSystem:SkyzerSystem;
                part navy:Navy;
                part target:Target;
                part environment:Environment;
                part operationalEnvironment:OperationalEnvironment; 
                part dod:DOD;
                part localFirstResponders:LocalFirstResponders;
                part satellite:Satellite;
            }
            part def SkyzerSystem{
                part airVehicle:AirVehicle;
                part controlStation:ControlStation;
                part recoverySystem:RecoverySystem;
                part payload:Payload;
                // properties typed by use cases
                use case supportC3Mission:Support_C3_Mission;
                use case supportMobilityMissions:SupportMobilityMissions;
                use case supportNonCombatantOperationsMission:SupportNonCombatantOperationsMission;
                use case provideCommunication:ProvideCommunication;
                use case conductSurveillance:ConductSurveillance;
                use case provideDisasterAssistance:ProvideDisasterAssistance;
                use case prepareForSar:ConductSAR::PrepareForSAR;
                use case planMission:PlanMission;
                use case loadMissionPayload:LoadMissionPayload;
                use case executeAirVehiclePreFlight:ExecuteAirVehiclePreFlight;
                use case transferAirVehicleToFlightDeck:TransferAirVehicleToFlightDeck;
                use case activateAndLaunchUAF:ActivateAndLaunchUAV;
                use case executeMission:ExecuteMission;
                use case finalizeMission:FinalizeMission;
                // operations as actions
                action L1;
                action L;
                action 'Relay Data and Comm UAV Communication';
                action 'unnamed_1';
            }
            part def SkyzerTeam;
            part def SupportTeam;
            part def Target{
                part lostCivilian:LostCivilian;
                part areaOfInterst:AreaOfInterest;
                part distressSailBoat:DistressSailBoat; 
                part floater:Floater;
            }
            part def TrainingTeam;
            part def UCARS{
                // redundant with UCARS part def under Use Cases
            }
            part def Weather{
                use case prepareForSar:ConductSAR::PrepareForSAR;
            }
        }
        package '3.MissionUseCases'{
            #performer part def EPIRB_PLB;
            #performer part def INMARSAT;
            #performer part def UCARS;
            part def Operator;
            part def FirstResponders;
            part def GroundCrew;
            part def GroundForces;
            part def MissionCommander :> NavySupport;
            part def NavySupport;
            part def PersonOfInterest;
            part def RescueCoordinator :> NavySupport;
            part def Rescuee{
                // the ref parts reflect the swimlane decomposition               
                ref part EPIRB;
                ref part Victim{
                    perform a1.'Sent Distress Call';
                }
            }
            // Had to create the action to perform it.
            action a1:'Non-Combatant Operations - Scenario 1';
            
            part def UAV_Operator;
            part def US_Airforce;
            part def US_Military;
            use case def ActivateAndLaunchUAV;
            use case def AircraftHoldsAtShipHover_OrbitStation;
            use case def ConductSAR{
                use case def DefendSAR_Resources;
                use case def EnforceLawsForSAR_Missions;
                use case def Maintain_SA_Of_SAR_Mission;
                use case def PostSAR_Mission_Task;
                use case def PrepareForSAR;
                use case def ProtectAndSecure_SAR_MissionElements;
                use case def RespondToSAR_Emergencies;
                use case def SupportUnitForSAR;
            }
            use case def ConductSurveillance;
            use case def ExecuteAirVehiclePreFlight;
            use case def ExecuteMission;
            use case def FinalizeMission;
            use case def LoadMissionPayload;
            use case def PlanMission{
                actor skyzerSystem:SkyzerSystem;
                actor missionCommander:MissionCommander; // specify as stakeholder (issue with v2)
                actor uav_Operator:UAV_Operator;
            }
            use case def PostMissionTasks;
            use case def ProvideCommunication; 
            use case def ProvideDisasterAssistance; 
            use case def RequestRescue;
            use case def ResupplyShipUsingAutonomousCargoHauling;
            use case def Support_C3_Mission;
            use case def SupportMobilityMissions;
            use case def SupportNonCombatantOperationsMission;
            use case def TransferAirVehicleToFlightDeck;
            use case def UAV_LandsOnShip;
            use case def UAV_TakeoffFromShip;
        }
        package '4.MissionBehavior'{
            action def 'Mission Command, Control and Communications Mission Area'{
                action 'Send Mission Orders';
                action 'Activate UAV';
                action 'Authorized UAV Return';
                action 'Command UAV Return';
                action 'Command UAV To Drop Payload';
                action 'Command UAV to Land';
                action 'Confirm Vessel';
                action 'Confirms Drop via Video Feed';
                action 'Detect Beacon';
                action 'Drop Payload';
                action 'Enter Mission Plan';
                action 'Grab UAV';
                action 'Guide UAV To Hold Point';
                action 'Guide UAV To Landing';
                action 'Hold Position';
                action 'Holds over Vessel';
                action 'Land UAV';
                action 'Launch UAV';
                action 'Load Mission Payload';
                action 'Locate Vessel';
                action 'Move UAV to Hanger';
                action 'Perform Pre-Flight';
                action 'Plan Mission';
                action 'Post Flight Service of UAV';
                action 'Ready for Mission';
                action 'Receive Command';
                action 'Receive Distress Call';
                action 'Receive Mission Orders';
                action 'Receive Mission Payload';
                action 'Receive Mission Plan_1'{
                    //renamed duplicate action
                }
                action 'Receive Mission Plan_2'{
                    //renamed duplicate action
                }
                action 'Receive Operating Orders';
                action 'Receive Payload';
                action 'Receive Request Report';
                action 'Receive Support Request From Air Force';
                action 'Receive Video';
                action 'Relay Data and Comm UAV Communication';
                action 'Release UAV_1'{
                    //renamed duplicate action
                }
                action 'Release UAV_2'{
                    //renamed duplication action
                }
                action 'Release UAV to Second Location';
                action 'Retrieve Payload from Storage';
                action 'Return to Hold Point';
                action 'Sent Distress Call';
                action 'Sent Request Additional Air Support';
                action 'Shut Down';
                action 'Start GPS Navigation';
                action 'Transfer Mission Plan';
                action 'Transfer To BLOS Comm';
                action 'Transfer to LOS Communication';
                action 'Transit to Mission Location'; 
                action 'Transmit Beacon';
                action 'Transmit Video';
                action 'Transverse Air Vehicle';
                action 'Transverse Air Vehicle to Flight Deck';
                action 'Turn Off UAV';                
            }
            action def 'Non-Combatant Operations - Scenario 1'{
                action 'Send Mission Order';
                action 'Activate UAV';
                action 'Authorized UAV Return';
                action 'Command UAV Return';
                action 'Command UAV To Drop Payload';
                action 'Command UAV to Land';
                action 'Confirm Vessel';
                action 'Confirms Drop via Video Feed';
                action 'Detect Beacon';
                action 'Drop Payload';
                action 'Enter Mission Plan';
                action 'Grab UAV';
                action 'Guide UAV To Hold Point';
                action 'Guide UAV To Landing'; 
                action 'Hold Position';
                action 'Holds over Vessel';
                action 'Land UAV';
                action 'Launch UAV';
                action 'Load Mission Payload';
                action 'Locate Vessel';
                action 'Move UAV to Hanger';
                action 'Perform Pre-Flight';
                action 'Plan Mission';
                action 'Post Flight Service of UAV';
                action 'Ready for Mission';
                action 'Receive Command';
                action 'Receive Distress Call';
                action 'Receive Mission Orders';
                action 'Receive Mission Payload';
                action 'Receive Mission Plan_1'{
                    // renamed duplicate action
                }
                action 'Receive Mission Plan_2'{
                    // renamed duplicate action
                }
                action 'Receive Operating Orders';
                action 'Receive Payload';
                action 'Receive Request Report';
                action 'Receive Support Request From Air Force';
                action 'Receive Video';
                action 'Relay Data and Comm UAV Communication'; 
                action 'Release UAV_1'{
                    // renamed duplicate action
                        }
                action 'Release UAV_2'{
                    // renamed duplicate action
                }
                action 'Release UAV to Second Location';
                action 'Retrieve Payload from Storage';
                action 'Return to Hold Point';
                action 'Sent Distress Call';  // sent or send?
                action 'Sent Request Additional Air Support'; // sent or send?
                action 'Shut Down';
                action 'Start GPS Navigation';
                action 'Transfer Mission Plan';
                action 'Transfer To BLOS Comm';
                action 'Transfer to LOS Communication'; 
                action 'Transit to Mission Location';
                action 'Transmit Beacon';
                action 'Transmit Video';
                action 'Transverse Air Vehicle';
                action 'Transverse Air Vehicle to Flight Deck';
                action 'Turn Off UAV';
                
                //sequences
                first start then 'Sent Distress Call';
                first 'Sent Distress Call' then 'Receive Distress Call';
                // entere the other flows.
                
                // the following tasks were treated as swim lanes which can be represented as ref parts.
                // they are more accurately represneted as actions which have nested actions that correspond 
                // to the above actions.
                action 'NCO 1: Prepare/Configure';
                action 'NCO 6: Respond to Emergencies'{
                    action 'MOB 2: Take Off';
                    action 'MOB 3: Transit/Navigate';
                }
                action 'NCO 8: Post Mission Task';

            }
            action def 'Non-Combatant Operations - Scenario 2'{
                action 'Send Mission Orders';
                action 'Activate UAV';
                action 'Authorized UAV Return';
                action 'Command UAV Return';
                action 'Command UAV To Drop Payload';
                action 'Command UAV to Land';
                action 'Confirm Vessel';
                action 'Confirms Drop via Video Feed';
                action 'Detect Beacon';
                action 'Drop Payload';
                action 'Enter Mission Plan';
                action 'Grab UAV';
                action 'Guide UAV To Hold Point';
                action 'Guide UAV To Landing';
                action 'Hold Position';
                action 'Holds over Vessel';
                action 'Land UAV';
                action 'Launch UAV';
                action 'Load Mission Payload';
                action 'Locate Vessel';
                action 'Move UAV to Hanger';
                action 'Perform Pre-Flight';
                action 'Plan Mission';
                action 'Post Flight Service of UAV';
                action 'Ready for Mission';
                action 'Receive Command'; 
                action 'Receive Distress Call';
                action 'Receive Mission Orders';
                action 'Receive Mission Payload'; 
                action 'Receive Mission Plan_1'{
                    // renamed duplicate action
                    }
                action 'Receive Mission Plan_2'{
                    // renamed duplicate action
                    }
                action 'Receive Operating Orders'; 
                action 'Receive Payload';
                action 'Receive Request Report';
                action 'Receive Support Request From Air Force';
                action 'Receive Video';
                action 'Relay Data and Comm UAV Communication';
                action 'Release UAV_1'{
                    // renamed duplicate action
                    }
                action 'Release UAV_2'{
                    // renamed duplicate action
                    }
                action 'Retrieve Payload from Storage';
                action 'Return to Hold Point';
                action 'Sent Distress Call';
                action 'Sent Request Additional Air Support';
                action 'Shut Down';
                action 'Start GPS Navigation';
                action 'Transfer Mission Plan';
                action 'Transfer To BLOS Comm';
                action 'Transfer to LOS Communication';
                action 'Transit to Mission Location';
                action 'Transmit Beacon';
                action 'Transmit Video';
                action 'Transverse Air Vehicle';
                action 'Transverse Air Vehicle to Flight Deck';
                action 'Turn Off UAV';
            }
        }
        package '5.MissionParametric'{
            import '8.SupportElements'::ValueTypes::*;
            part def MissionMOEs{
                attribute 'cruise speed':knots;
                attribute 'max payload weight':lbs;
                attribute 'operational radius':nm;
                attribute 'operational endurance':h;
                attribute 'launch & recover sea state':Integer;
                attribute 'recovery condition':Real;
                constraint {'cruise speed' >= 170}
                constraint {'launch & recover sea state' >= 5}
                constraint {'max payload weight' >= 200}
                constraint {'operational endurance' >= 4}
                constraint {'operational radius' >= 200}
                constraint {'recovery condition' >= 0.3}
            }
        }
        package '6.MissionInterfaceDefinitions'{
            item def 'Commanders Intent';
            item def 'Communication Data';
            item def 'Commutation Hub';
            item def 'EO/IR';
            item def 'Geo Tagging';
            item def 'GPS Location Request';
            item def 'GPS Position Data';
            item def 'Hurricanes Force Wind';
            item def 'IR Reading Data';
            item def 'Landing Hook / Gear';
            item def 'Location Tracking';
            item def 'Maintenance';
            item def 'Network';
            item def 'Network Links';
            item def 'Severe Weather';
            item def 'Streaming Video Capture';
            item def 'Streaming Video Data';
            item def 'Target Location Data';
            item def 'Training Missions';
            item def 'UAV Command Controls';
            item def 'UAV navigation data';
        }
        package '7.SkyzerUAV'{
            import '6.MissionInterfaceDefinitions'::*;
            package '1.BlackBoxSpecifications'{
                part def '1.BlackBoxSpecifications'{
                    part skyzerSystem:SkyzerSystem;
                    part skyzerTeam:SkyzerTeam;
                    part supportTeam:SupportTeam;
                    part ddgClassShip:DDG_ClassShip;
                    part littoralCombatShip:LittoralCombatShip;
                    part satellite:Satellite;
                    part trainingTeam:TrainingTeam;
                    part weather:Weather;
                    part dod:DOD;
                    part areaOfInterest:AreaOfInterest;
                    part localFirstResponders:LocalFirstResponders;
                    part lostCivilian:LostCivilian;
                    part navyShip:NavyShip;
                    part groundCrew:GroundCrew;
                    part maintenanceTeam:MaintenanceTeam;
                    //part supportTeam:SupportTeam; this is redundant part
                    connect skyzerSystem to skyzerTeam{
                        // issue- can I establish direction for item flow without the perform or without using messages
                        in item i1:'UAV Command Controls';
                        out item i2:'UAV navigation data';
                        out item i3:'IR Reading Data';
                        out item i4:'Streaming Video Data';
                    }
                    message of 'UAV Command Controls' from skyzerSystem to skyzerTeam;
                    connect skyzerSystem to maintenanceTeam;
                    connect skyzerSystem to trainingTeam;
                    connect skyzerSystem to navyShip;
                    connect skyzerSystem to satellite;
                    connect skyzerSystem to dod;
                    connect skyzerSystem to areaOfInterest;
                    connect skyzerSystem to localFirstResponders;
                    connect skyzerSystem to lostCivilian;
                    connect skyzerSystem to weather;
                }
            }
        }
        package '8.SupportElements'{
            import ValueTypes::*;
            package BackgroundInformation{}
            package Glossary{
                import Definitions::*;
                package Acroynyms{
                    // can use alias or short name
                    alias CCC_ for 'Command, Control and Communication';
                }
                package Definitions{
                    // the following can replace doc as the annotating element for CCC
                    comment <C3> 'Command, Control and Communication' about CCC
                    /* The exercise of authority and direction by a properly designated commander 
                    over assigned and attached forces in the accomplishment of the mission.  
                    C3 function are performed through an arrangement of personnel, equipment, 
                    communications, facilities, and procedures employed by a commander in 
                    planning, directing, coordinating, and controlling forces and operations 
                    in the accomplishment of the mission.
                    */
                }
            }
            package MissionDataModel{
                dependency from 'System Function' to 'TTP/ Doctrine';
                dependency from 'System Function' to 'Resources / Information';
                dependency from 'System Function' to 'System';
                dependency from 'System Function' to 'Measure';
                dependency from 'Person/Role' to 'System';
                dependency from 'Person/Role' to 'Platform';
                dependency from 'Person/Role' to 'Task';
                dependency from 'Person/Role' to 'Need';
                dependency from 'Person/Role' to 'Resources / Information';
                dependency from 'Task' to 'System Function';
                dependency from 'Task' to 'Resources / Information';
                dependency from 'Task' to 'Measure';
                dependency from 'Task' to 'TTP/ Doctrine';
                dependency from 'Task' to 'Mission Area /ROC';
                dependency from 'Task' to 'Condition';
                dependency from 'System' to 'Platform';
                dependency from 'System' to 'Resources / Information';
                dependency from 'Desired Effect' to 'Measure';
                dependency from 'Mission' to 'Desired Effect';
                item def 'Condition';
                item def 'Desired Effect';
                item def 'Measure';
                item def 'Mission'{
                    item task:Task [1..*];
                }
                item def 'Mission Area /ROC'{
                    item mission:Mission [1..*];
                }
                item def 'Need';
                item def 'Person/Role';
                item def 'Platform';
                item def 'Resources / Information';
                item def 'System';
                item def 'System Function';
                item def 'Task';
                item def 'TTP/ Doctrine';
            }
            package MissionDataTypes{}
            package MissionRequirementDataTypes{}
            package References{}
            package ValueTypes{
                import ScalarValues::*;
                attribute def h;
                attribute def knots;
                attribute def lbs;
                attribute def nm;
            }
        }
        package '9.LessonsLearned'{
            package LessonLearnObjectTypes{
                package LessonLearnedObjectTypes_extensions{
                    import Metaobjects::SemanticMetadata;
                    
                    item languages [*] nonunique;
                    metadata def language1 :> SemanticMetadata {
                        :>> baseType = languages meta SysML::ItemUsage;
                    }
                    
                    action methodologies [*] nonunique;
                    metadata def methodology :> SemanticMetadata {
                        :>> baseType = methodologies meta SysML::ActionUsage;
                    }
                    
                    part tools [*] nonunique;
                    metadata def tool :> SemanticMetadata {
                        :>> baseType = tools meta SysML::PartUsage;
                    }
                }
            }
        }
        
        import '11.LanguageCustomization'::*; 
        package '11.LanguageCustomization'{
            import KeyWordMetadataDefinitions::*;
            import ImageDefinitions::*;
            package KeyWordMetadataDefinitions{
                import Metaobjects::SemanticMetadata;
                
                state 'failure modes'[*] nonunique;
                // with alias <fm>
                metadata def <fm> 'failure mode' :> SemanticMetadata {
                    :>> baseType = 'failure modes' meta SysML::StateUsage;
                }
                
                part performers [*] nonunique;
                metadata def performer :> SemanticMetadata {
                    :>> baseType = performers meta SysML::PartUsage;
                }
            }
            package ImageDefinitions{
                import ImageMetadata::*{
                    // this provides the icon for smallImage as an adornment or marker 
                    // or fullImage for rendering the annotated element
                }

                attribute def Image1:> Image{
                    attribute :>> location = "https://xyz";
                }
                attribute image1:Image1;
            }
        }
    }
    package SkyzerMissionModel_refactored{
        import AttributeDefinitions::*;
        package <'11'> AttributeDefinitions{
            import ScalarValues::*;
            import NumericalFunctions::*;
            import ISQ::*;
            import SI::*;
            import USCustomaryUnits::*;
        }
        package MissionStatement{
            package StakeholderConcerns{
                import Stakeholders::*;
                concern Compatibility{
                    doc /* this is a concern for stakdholder1 and stakeholder2*/
                    stakeholder stakeholder1:Stakeholder1;
                    stakeholder stakeholder2:Stakeholder2;
                }
                concern Cost;
                concern Ergonomics;
                concern Flexibility;
                concern Logistics;
                concern Maintainability;
                concern MissionPerformance;
                concern Responsiveness;
                concern Safety;
                concern Survival;
            }
            package Stakeholders{
                part def Stakeholder1;
                part def Stakeholder2;
            }
        }
    }
    package Sandbox{
        package FlowsAndMessages{
            item def I1;
            item def I2;
            item def I3;
            item def I4;
            part part0d{
                part part1;
                part part2;
                connect part1 to part2{
                    message of I1 from part1 to part2;
                    message of I2 from part1 to part2;
                    message of I3 from part2 to part1;
                    message of I4 from part2 to part1;
                }
            }
        }
        package Example2{
            part def P0{
                part p1;
            }
            //part p0:P0
            //part p2=p0.p1;
            //part p2=P0::p1;
        }
    }
}

%publish sfriedenthal_SoS

%viz

%viz --view tree --style compmost SkyzerModel_v2::SkyzerMissionModel_transformed::'0.MissionStatement'::MissionCapabilityArea

%viz --view tree --style compmost SkyzerModel_v2::SkyzerMissionModel_transformed::'1.MissionRequirements'::'1.0.MissionRequirements'

%viz --view tree --style compmost SkyzerModel_v2::SkyzerMissionModel_transformed::'2.MissionStructure'

%viz --view mixed --style showinherited SkyzerModel_v2::SkyzerMissionModel_transformed::'0.MissionStatement'::OV_1

%viz --view mixed --style compmost --style lr SkyzerModel_v2::SkyzerMissionModel_transformed
