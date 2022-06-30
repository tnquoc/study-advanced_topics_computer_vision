function [output] = inner_product_forward(input, layer, param)

    d = size(input.data, 1);
    k = size(input.data, 2); % batch size
    n = size(param.w, 2);

    % Replace the following line with your implementation.
    output.height = 1;
    output.width = 1;
    output.channel = layer.num;
    output.batch_size = input.batch_size;
    output.data = transpose(param.w) * input.data + repmat(param.b(:, 1), layer.num, k);
    
end