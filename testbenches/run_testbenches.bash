if [ -f log.txt ]; then
    rm -f log.txt
fi

iverilog -g2012               \
            -o sim.out        \
            ../subdesign/electron_beam_positioner.sv \
            ./*.sv            \
            >> log.txt 2>&1   \
            && vvp sim.out    \
            >> log.txt 2>&1

rm -f sim.out
