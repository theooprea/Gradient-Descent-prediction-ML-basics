function [w] = learn(X, y, lr, epochs)
  [n m] = size(X);
  w = -1 + 2 .* rand(m + 1,1);
  for i = 1 : m
    X(:,i) = (X(:,i) - mean(X(:,i))) / std(X(:,i));
  end
  new_column = ones(n,1);
  X_tilda = [X new_column];
  for epoch = 1 : epochs
    k = randperm(n);
    X_batch = X_tilda(k(1 : 64),:);
    y_batch = y(k(1 : 64));
    for i = 1 : m + 1
      suma_actuala = 0;
      for j = 1 : 64
        suma_actuala = suma_actuala + (X_batch(j,:) * w - y_batch(j)) * X_batch(j, i);
      end
      w(i) = w(i) - lr * (1 / 128) * suma_actuala;
    end
  end
endfunction
