function   fismat=apply_ga(fismat,output,data)


input_weights=[];
for ii=1:length(fismat.rule)
input_weights=[input_weights fismat.rule(1,ii).weight];
end



new_weight(1:length(fismat.rule))=rand;


for ii=1:length(fismat.rule)
fismat.rule(1,ii).weight=new_weight(1,ii);
end

O=data(1:length(data),13);
handle = @(x) mse_test(output,O);
ga_opts = gaoptimset('TolFun', 1e-6,'display','iter','PopulationSize',20,'EliteCount',2,'CrossoverFraction',0.8000,...
                     'MigrationInterval',20,'MigrationFraction',0.2000,'Generations',100);
                 
no_of_weights=length(fismat.rule);                 
[x_ga_opt, err_ga] = ga(handle, no_of_weights, ga_opts);
