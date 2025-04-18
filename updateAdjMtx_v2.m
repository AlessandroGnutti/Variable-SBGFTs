function W = updateAdjMtx_v2(W, symm, pos)
% Called by computeWLG.

N       = sqrt(size(W,1));

% Locations of the adjency matrix (column ordering)
aux     = 1:N^2;
aux     = reshape(aux, [N, N]);
switch symm
    
    case {'lr', 'ud'}
        if strcmp(symm, 'ud')
            aux = aux';
        end
        if pos < N/2+1
            a   = aux(:, 1:ceil(pos)-1);
            a   = a(:);
            b   = aux(:, floor(pos)+1:2*pos-1);
            b   = fliplr(b);
            b   = b(:);
        else
            a   = aux(:, 2*pos-N:ceil(pos)-1);
            a   = a(:);
            b   = aux(:, floor(pos)+1:end);
            b   = fliplr(b);
            b   = b(:);
        end
        
    case {'ad', 'd'}
        if strcmp(symm, 'd')
            aux = fliplr(aux);
        end
        if pos <= N
            temp    = aux(1:pos, 1:pos); % Submatrix
        else
            temp    = aux(pos-end+1:end, pos-end+1:end); % Submatrix
        end
        t       = 0;
        a       = zeros( (length(temp(:))-size(temp,1))/2 , 1);
        b       = zeros( (length(temp(:))-size(temp,1))/2 , 1);
        for i = 1:size(temp,1)-1
            for j = 1:size(temp,2)-i
                t   = t + 1;
                a(t) = temp(i,j);
                b(t) = temp(end+1-j, end+1-i);
            end
        end
        
    case 'c'
        if pos(1) < N/2+1 && pos(2) < N/2+1
            temp    = aux(1:2*pos(1)-1, 1:2*pos(2)-1); % Submatrix
        elseif pos(1) >= N/2+1 && pos(2) < N/2+1
            temp    = aux(2*pos(1)-N:end, 1:2*pos(2)-1); % Submatrix
        elseif pos(1) < N/2+1 && pos(2) >= N/2+1
            temp    = aux(1:2*pos(1)-1, 2*pos(2)-N:end); % Submatrix
        elseif pos(1) >= N/2+1 && pos(2) >= N/2+1
            temp    = aux(2*pos(1)-N:end, 2*pos(2)-N:end); % Submatrix
        end
        t       = 0;
        end_for = floor((length(temp(:))/2));
        a       = zeros(end_for, 1);
        b       = zeros(end_for, 1);
        bln     = false;
        for i = 1:size(temp,1)
            if bln
                break;
            end
            for j = 1:size(temp,2)
                t       = t + 1;
                a(t)    = temp(i,j);
                b(t)    = temp(end+1-i, end+1-j);
                if t == end_for
                    bln = true;
                    break;
                end
            end
        end
        
end

W(sub2ind(size(W), a, b)) = 1;
W(sub2ind(size(W), b, a)) = 1;