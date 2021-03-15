function ME2D = gridClass( ME2D )
    ME2D.Grid.PE = zeros( length( ME2D.X ), length( ME2D.Y ));
    ME2D.Grid.NPE = ME2D.Grid.PE;
    L = ME2D.L;
    
    for i = 1:length( ME2D.X )
        x = ME2D.X(i);
        
        for j = 1:length( ME2D.Y )
            y = ME2D.Y(j);
            
            ME2D.Grid.PE(j,i) = ML_PE_G( x, y, L.A.PE, L.B.PE, L.C.PE );
            ME2D.Grid.NPE(j,i) = ML_NPE( x, y, L.A.NPE, L.B.NPE, L.C.NPE );
        end
    end
    
end

function est = ML_PE_G ( x, y, A, B, C )
    est = 0;
end

function est = ML_NPE ( x, y, A, B, C )
    est = 0;
end