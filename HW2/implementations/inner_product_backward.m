function [param_grad, input_od] = inner_product_backward(output, input, layer, param)
    input_od = zeros(size(input.data));

    param_grad.b = zeros(size(param.b));
    param_grad.w = zeros(size(param.w));

    % Replace the following lines with your implementation.

    size(output), size(input), param


end
