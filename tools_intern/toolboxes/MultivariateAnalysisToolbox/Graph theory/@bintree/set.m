function tr = set(tr,varargin)

% SET set method
% -----------------------------------------------
% tr = set(tr, property_name, property_value,...)
% -----------------------------------------------
% Description: sets field values.
% Input:       {tr} BINTREE instance.
%              {property_name},{property_value} legal pairs.
% Output:      {tr} updated BINTREE instance.

% � Liran Carmel
% Classification: SET/GET functions
% Last revision date: 11-Jan-2005

% first argument is assured to be the BINTREE. parse property_name,
% property_value pairs
error(chkvar(nargin-1,{},'even',{mfilename,'List of properties',0}));
no_instances = numel(tr);
for ii = 1:2:length(varargin)
    error(chkvar(varargin{ii},'char','vector',{mfilename,'',ii+1}));
    errmsg = {mfilename,'',ii+2};
    switch str2keyword(varargin{ii},6)
        case 'l_node'       % field: l_node
            error(chkvar(varargin{ii+1},'numeric','vector',errmsg));
            % loop on instances
            for jj = 1:no_instances
                tr(jj).l_node = varargin{ii+1};
            end
        case 'r_node'       % field: r_node
            error(chkvar(varargin{ii+1},'numeric','vector',errmsg));
            % loop on instances
            for jj = 1:no_instances
                tr(jj).r_node = varargin{ii+1};
            end
        otherwise
            % loop on instances
            for jj = 1:no_instances
                tr(jj).tree = set(tr(jj).tree,varargin{ii},varargin{ii+1});
            end
    end
end