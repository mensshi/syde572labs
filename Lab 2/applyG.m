function new_A = applyG ( old_A, pnt_A, pnt_B, true_class )
    new_A = rand(0,2);
    for i = 1:size( old_A, 1)
        if MED( old_A(i,:), pnt_A, pnt_B) ~= true_class
            new_A = [new_A; old_A(i,:)];
        end
    end
end