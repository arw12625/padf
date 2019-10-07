classdef PolySwitchLinSys
    %PolySwitchLinSys represents a switched linear system with polytopic regions
    %The dynamics of the system are given by 
        %x(k+1) = A{s} x(k) + B{s} u(k) + E{s} w(k) + f{s}
        % x \in X, u \in U, w \in W, s \in S
    %X,U,W are all MPT polytopes
    %S = {1,...,ns}
    
    properties
        A
        B
        E
        f
        X
        U
        W
        n % state dimension
        m % input dimension
        l % disturbance dimension
        ns % number of switching modes
    end
    
    methods
        function obj = PolySwitchLinSys(A,X,B,U,E,W,f)
            %PolySwitchLinSys Construct an instance of this class
            obj.A = A;
            obj.B = B;
            obj.E = E;
            obj.X = X;
            obj.U = U;
            obj.W = W;
            obj.n = size(A{1},2);
            obj.m = size(B{1},2);
            obj.l = size(E{1},2); 
            obj.ns = size(A,1);
            obj.f = f;
        end
        
        function obj = createEmptySys(n,m,l,ns)
            %createEmptySys initialize a system with the given dimensions
                %with zero dynamics and empty regions
            obj = PolyLinSys( ...
                zeros(n), ...
                Polyhedron('H',zeros(1,n+1)), ...
                zeros(n,m), ...
                Polyhedron('H',zeros(1,m+1)), ...
                zeros(n,l), ...
                Polyhedron('H',zeros(1,l+1)), ...
                zeros(n,1));
        end
    end
end
