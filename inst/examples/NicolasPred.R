#install.packages("devtools")
#devtools::install_github("choisy/gamar")
library(gamar)
defpath("/Applications/Gama.app")
myModelPath <- "/Users/jdz/git/gamar/inst/examples"
#(myModelFile <- paste0(system.file("examples",package="gamar"),"/cluster_ind.gaml"))
(myModelFile <- paste0(myModelPath,"/NicolasPred.gaml"))

(experimentPREY <- getmodelparameter(modelfile = myModelFile,experimentname = "prey_predator"))
(getparameternames(experimentPREY))

action_distance <- data.frame("action_distance"=c(100,200,300,400,500,600,700,800,900,1000,1500,2000,2500,3000,3500,4000,5500,6000,7000,8000,9000,10000,12000,14000,16000,20000,25000,30000,40000,50000))
environment_size <-  data.frame("environment_size"=c(500,10000,15000,20000,30000,40000,50000))
all_seed <-  data.frame("mseed"=seq(1,30,1))


simulation_duration <- 5000;
# To test we set a shorter duration...
simulation_duration <- 3;

simulations <- merge(action_distance,environment_size,by=NULL)
simulations <- merge(simulations,all_seed,by=NULL )
sim2 <- simulations

#sim2 <- simulations[!simulations$min_distance_crasy>simulations$max_distance_crasy,]
experiment1 <- experimentPREY
experimentplan <- NULL

for (i in 1:nrow(sim2))
{
  local_experiment <-  setparametervalue(experiment1,"danger_distance",sim2[i,"action_distance"])
  local_experiment <-  setparametervalue(local_experiment,"environment_size",sim2[i,"environment_size"])
  local_experiment <-  setparametervalue(local_experiment,"currentSeed",sim2[i,"mseed"])
  local_experiment <-  setparametervalue(local_experiment,"simulation_id",i)
  local_experiment <- setfinalstep(local_experiment,simulation_duration)

  local_experiment <- setoutputframerate(local_experiment,"nb_predators",1)
  local_experiment <- setoutputframerate(local_experiment,"nb_preys",1)
  local_experiment <- setoutputframerate(local_experiment,"micro_b",1)
  local_experiment <- setoutputframerate(local_experiment,"mean_pop",1)
  local_experiment <- setmodelpath(local_experiment,"../models/cluster_ind.gaml")
  local_experiment <- setsimulationid(local_experiment,i)
  local_experiment <- setseed(local_experiment,sim2[i,"mseed"])

  experimentPlan  <- list()
  experimentPlan <- addtoexperimentplan(simulation = local_experiment,experimentplan = experimentPlan)
  experimentPlan$Simulation$.attrs['id'] <- i
  outFile <- paste0("/tmp/experiment/input_",i,".xml")
  writemodelparameterfile(experimentPlan,outFile)
}
