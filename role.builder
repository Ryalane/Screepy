var roleBuilder = {

    /** @param {Creep} creep **/
    run: function(creep) {
// turn flag off when creep is empty
	    if(creep.memory.building && creep.carry.energy == 0) {
            creep.memory.building = false;
	    }
// turn flag on when creep is full
	    if(!creep.memory.building && creep.carry.energy == creep.carryCapacity) {
	        creep.memory.building = true;
	    }
// if flag is on
    //build any construction site, if there is one
	    if(creep.memory.building) {
	        var targets = creep.room.find(FIND_CONSTRUCTION_SITES);
            if(targets.length > 0) {
                if(creep.build(targets[0]) == ERR_NOT_IN_RANGE) {
                    creep.moveTo(targets[0]);
                }
            }
    // park if there is no building site
            else {
                console.log('Builder Parked');
                creep.moveTo(7,19);
            }
	    }
// if flag is off
    // harvest closest source
	    else {
	        var sources = creep.room.find(FIND_SOURCES);
            var closestSource = creep.pos.findClosestByRange(FIND_SOURCES_ACTIVE);
            if(creep.harvest(closestSource) == ERR_NOT_IN_RANGE) {
                creep.moveTo(sources[0]);
            }
	    }
	}
};
module.exports = roleBuilder;
