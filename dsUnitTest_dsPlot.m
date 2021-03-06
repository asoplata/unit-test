%{
This is meant to be run INTERACTIVELY, not automatically, so that one can use visual inspection to determine:
1. The plot is plotted
2. The correct data is plotted
3. The plot details are correct (labels, ranges, lines drawn, legends, etc.)
%}

testPowerPlotting = 1;
testRastergramPlotting = 1;
testRatesPlotting = 0;
testWaveformPlotting = 1;

% dsPlot: 1 pop, 1 cell, 0 varied
data=dsSimulate('dv/dt=@M+10; {iNa,iK}@M');
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 1 pop, 5 cells, 0 varied
data=dsSimulate('dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M','tspan',[0 300]);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 2 pops, 1 cell/each, 0 varied
s=[];
s.pops(1).equations='dv/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65';
s.pops(2).equations='dv/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65';
data=dsSimulate(s,'tspan',[0 400]);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 2 pops, 1 cell & 5 cells, 0 varied
s=[];
s.pops(1).equations='dv/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65';
s.pops(2).equations='dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65';
data=dsSimulate(s,'tspan',[0 400]);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 2 pops, 5 cells/each, 0 varied
s=[];
s.pops(1).equations='dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65';
s.pops(2).equations='dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-45';
data=dsSimulate(s,'tspan',[0 600]);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 1 pop, 1 cell, 1 varied
vary={'pop1','gNa',[50 200 400]};
data=dsSimulate('dv/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M','vary',vary);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 1 pop, 5 cells, 1 varied
vary={'pop1','gNa',[50 200 400]};
data=dsSimulate('dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M','vary',vary);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 2 pops, 5 cells/each, 1 varied
vary={'pop1','gNa',[50 200 400]};
s=[];
s.pops(1).equations='dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65';
s.pops(2).equations='dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65';
data=dsSimulate(s,'tspan',[0 600],'vary',vary);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 1 pop, 1 cell, 2 varied
vary={'pop1','gNa',[50 200 400];'pop1','gK',[25 50 100]};
data=dsSimulate('dv/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M','vary',vary);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 1 pop, 5 cells, 2 varied
vary={'pop1','gNa',[50 200 400];'pop1','gK',[25 50 100]};
data=dsSimulate('dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M','vary',vary);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 2 pops, 5 cells/each, 2 varied
vary={'pop1','gNa',[50 200 400];'pop1','gK',[25 100]};
s=[];
s.pops(1).equations='dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65';
s.pops(2).equations='dv[5]/dt=@M+10*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65';
data=dsSimulate(s,'tspan',[0 600],'vary',vary);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 1 pop, 1 cell, 3 varied
vary={'pop1','gNa',[50 400];'pop1','gK',[25 100];'pop1','amp',[10 20]};
data=dsSimulate('dv/dt=@M+amp*(t>150*rand(1,Npop)); {iNa,iK}@M','vary',vary);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 1 pop, 5 cells, 3 varied
vary={'pop1','gNa',[50 400];'pop1','gK',[25 100];'pop1','amp',[10 20]};
data=dsSimulate('dv[5]/dt=@M+amp*(t>150*rand(1,Npop)); {iNa,iK}@M','vary',vary);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end

% dsPlot: 2 pops, 5 cells/each, 3 varied
vary={'pop1','gNa',[50 400];'pop1','gK',[25 100];'pop2','amp',[10 20]};
s=[];
s.pops(1).equations='dv[5]/dt=@M+amp*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65; amp=10';
s.pops(2).equations='dv[5]/dt=@M+amp*(t>150*rand(1,Npop)); {iNa,iK}@M; v(0)=-65; amp=10';
data=dsSimulate(s,'tspan',[0 600],'vary',vary);
if testWaveformPlotting ; dsPlot(data,'bin_size',50,'bin_shift',15) ; end
if testRastergramPlotting ; dsPlot(data,'plot_type','rastergram') ; end
if testRatesPlotting ; dsPlot(data,'plot_type','rates') ; end
if testPowerPlotting ; dsPlot(data,'plot_type','power') ; end
