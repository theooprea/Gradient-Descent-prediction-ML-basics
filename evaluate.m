function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X y] = preprocess(path_to_testset, histogram, count_bins);
  [n m] = size(X);
  for i = 1 : m
    X(:,i) = (X(:,i) - mean(X(:,i))) / std(X(:,i));
  end
  idx = (y == 1);
  n_cats = sum(idx);
  n_not_cats = n - n_cats;
  new_column = ones(n, 1);
  X_tilda = [X new_column];
  y_de_evaluat = X_tilda * w;
  cazuri_reusite = 0;
  cazuri_totale = n;
  for i = 1 : n_cats
    if(y_de_evaluat(i) >= 0)
      cazuri_reusite = cazuri_reusite + 1;
    end
  end
  for i = n_cats + 1 : n_not_cats + n_cats
    if(y_de_evaluat(i) < 0)
      cazuri_reusite = cazuri_reusite + 1;
    end
  end
  percentage = double(cazuri_reusite) / cazuri_totale;
endfunction