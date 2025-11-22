module timer(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [1:0] minutos,
    output reg [5:0] segundos,
    output reg [3:0] decimos,
    output reg E
);

    // O clock é de 50MHz. Para contar 0.1s (um décimo de segundo),
    // precisamos de 50,000,000 / 10 = 5,000,000 ciclos de clock.
    parameter TENTH_OF_A_SECOND = 5000000;

    reg [22:0] clk_counter; // Contador para os ciclos de clock (2^23 > 5,000,000)

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reseta o timer para 3 minutos
            minutos <= 2'd3;
            segundos <= 6'd0;
            decimos <= 4'd0;
            clk_counter <= 23'd0;
            E <= 1'b0;
        end else if (enable) begin
            // Verifica se o timer já chegou a zero
            if (minutos == 0 && segundos == 0 && decimos == 0) begin
                E <= 1'b1; // Sinaliza que o tempo acabou
            end else begin
                // Incrementa o contador de ciclos de clock
                if (clk_counter == TENTH_OF_A_SECOND - 1) begin
                    clk_counter <= 0;
                    // Decrementa os décimos de segundo
                    if (decimos > 0) begin
                        decimos <= decimos - 1;
                    end else begin
                        decimos <= 9;
                        // Decrementa os segundos
                        if (segundos > 0) begin
                            segundos <= segundos - 1;
                        end else begin
                            segundos <= 59;
                            // Decrementa os minutos
                            if (minutos > 0) begin
                                minutos <= minutos - 1;
                            end
                        end
                    end
                end else begin
                    clk_counter <= clk_counter + 1;
                end
            end
        end
    end

endmodule
