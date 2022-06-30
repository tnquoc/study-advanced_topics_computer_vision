function [input_od] = relu_backward(output, input, layer)

    % Replace the following line with your implementation.
    input_od = input.data;
    pos_values = input.data > 0;
    input_od = (output.diff).*(pos_values);
end
