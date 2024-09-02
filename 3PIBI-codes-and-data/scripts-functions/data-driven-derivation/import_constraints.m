function res = import_constraints(filename)
res={};
info=whos(matfile(filename));
    for i = 1:numel(info)
        A=load(filename, strcat('Expression',num2str(i)));
        A=A.(strcat('Expression',num2str(i)));
        res={res{:},A};
    end
end