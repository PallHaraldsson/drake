function flag = inPolyhedron(verts,pt)
% check if pt is in the polyhedron generated by verts
% @param verts    A 3 x N matrix, verts(:,i) is the location of the i'th
% vertex
% @param pt     A 3 x M matrix, pt(:,i) is the location of the i'th point
% to be checked
[A,b,Aeq,beq] = vert2lcon(verts');
num_pts = size(pt,2);
flag = all(bsxfun(@times,ones(1,num_pts),b)-A*pt>=0,1);
if(~isempty(Aeq))
  flag = flag & all(bsxfun(@times,ones(1,num_pts),beq)-Aeq*pt==0,1);
end
end