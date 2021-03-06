%%% =======================================================================
%%% = getLifetime.m
%%% = Alex Turner
%%% = 06/03/2016
%%% =----------------------------------------------------------------------
%%% = NOTES
%%% =  ( 1): Computes the methane lifetime.
%%% =----------------------------------------------------------------------
%%% = INPUTS
%%% =  ( 1): St  -- Our time vector.
%%% =  ( 2): ems -- Emission sources (and OH) for the box model.
%%% =----------------------------------------------------------------------
%%% = OUTPUTS
%%% =  ( 1): tau -- Structure with the methane lifetimes.
%%% =======================================================================

function [ tau ] = getLifetime( St, ems )

%%% Get some parameters for computing the methane lifetime
params = getParameters(St);

%%% Get time-dependent OH reaction rate
R_NH = ems.nh_oh * params.k_12ch4; % NH
R_SH = ems.sh_oh * params.k_12ch4; % SH

%%% Get the lifetimes
tau_NH  = 1 ./ ( R_NH .* params.YrToDay );  % yr
tau_SH  = 1 ./ ( R_SH .* params.YrToDay );  % yr
tau_GLO = mean([tau_NH,tau_SH],2);          % yr

%%% Make an output structure
tau.nh  = tau_NH;
tau.sh  = tau_SH;
tau.glo = tau_GLO;

end


%%% =======================================================================
%%% = END
%%% =======================================================================
