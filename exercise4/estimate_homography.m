function H = estimate_homography(px1, py1, px2, py2)
    
    if length(px1) < length(px2)
        n = length(px1);
    else
        n = length(px2);
    end
    
    col1 = [];
    col2 = [];
    col3 = [];
    col4 = [];
    col5 = [];
    col6 = [];
    col7 = [];
    col8 = [];
    col9 = [];
    
    for i = 1:n
       
        col1 = [col1 px1(i) 0];
        col2 = [col2 py1(i) 0];
        col3 = [col3 1 0];
        col4 = [col4 0 px1(i)];
        col5 = [col5 0 py1(i)];
        col6 = [col6 0 1];
        col7 = [col7 -px2(i)*px1(i) -py2(i)*px1(i)];
        col8 = [col8 -px2(i)*py1(i) -py2(i)*py1(i)];
        col9 = [col9 -px2(i) -py2(i)];
        
    end
    
    % Sestavi matriko A.
    A = [col1' col2' col3' col4' col5' col6' col7' col8' col9'];
    
    % Dekompozicija matrike A.
    [U, S, V] = svd(A);
    
    % Izracun vektorja h.
    [h, w] = size(V);
    vec =  V(:, h);
    % length(vec)
    h = vec(:) / V(h, w);
    
    H = reshape(h, 3, 3);
    
    
    
    
    
    
    
    
    
    
    
    
    