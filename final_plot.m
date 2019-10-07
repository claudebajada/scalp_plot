function final_plot(my_gifti , brain, data)

%% This code was MODIFIED from the GIFTI code by Guillaume Flandin 
% Code to plot our scalp maps
% 
% ORIGINAL COPYRIGHT STATEMENT 
% It was distributed under the GNU General Public License
%__________________________________________________________________________
% Copyright (C) 2008 Wellcome Trust Centre for Neuroimaging
% 
% Guillaume Flandin
% $Id: plot.m 5888 2014-02-19 19:54:12Z guillaume $
% 
%  This program is free software; you can redistribute it and/or
%  modify it under the terms of the GNU General Public License
%  as published by the Free Software Foundation; either version 2
%  of the License, or any later version.
% 
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
% 
%  You should have received a copy of the GNU General Public License
%  along with this program; if not, write to the Free Software
%  Foundation Inc, 59 Temple Pl. - Suite 330, Boston, MA 02111-1307, USA.
%__________________________________________________________________________

h = figure;

ax = axes('Parent',h);

axis(ax,'equal');
axis(ax,'off');
hp = patch(struct(...
    'vertices',  my_gifti.vertices,...
    'faces',     my_gifti.faces,...
    'FaceColor', 'none',...
    'EdgeColor', [.8 , .8 , .8],...
    'Parent',ax));

hold on;

hp2 = patch(struct(...
    'vertices',  my_gifti.vertices,...
    'faces',     my_gifti.faces,...
    'FaceColor', 'b',...
    'EdgeColor', 'none',...
    'Parent',ax));
set(hp2,'FaceVertexCData',data.cdata(:), 'FaceColor','interp')

alpha .8

hold on;

hp3 = patch(struct(...
    'vertices',  brain.vertices,...
    'faces',     brain.faces,...
    'FaceColor', [1 , .4, .4],...
    'EdgeColor', 'none',...
    'Parent',ax));

set(h,'colormap',jet)

axes(ax);
camlight;
camlight(-80,-10);
lighting phong;
axes(ax);
cameratoolbar; 

