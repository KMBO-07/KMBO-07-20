function mark_angle(r)
    num_steps=[]
    while isborder(r,Sud)==false || isborder(r,West)
        push!(num_steps, moves!(r, West))
        push!(num_steps, moves!(r, Sud))
    end
    for side in (Nord,Ost,Sud,West)
        moves!(r,side)
        putmarker!(r)
    end
    for (i,n) in enumerate(reverse!(num_steps))
        side = isodd(i) ? Ost : Nord # odd - нечетный
        moves!(r,side,n)
    end
end
function moves!(r,side)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
moves!(r,side,num_steps) = for _ in 1:num_steps move!(r,side)
 end
