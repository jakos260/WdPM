def create_four_bytes(bytes_str):
    if len(bytes_str)==1:
        return f"000{bytes_str}"
    elif len(bytes_str)==2:
        return f"00{bytes_str}"
    elif len(bytes_str)==3:
        return f"0{bytes_str}"
    else:
        return bytes_str[:3]

def process_jumps(program):
    lines = program.split('\n')
    labels = {}

    # Zbieranie etykiet (ADR_A, ADR_B, itd.) i przypisywanie im numerów linii
    for i, line in enumerate(lines):
        line = line.strip()
        if "#AD_" in line:
            label = line.split("#")[1]
            labels[label] = str(create_four_bytes(hex(i+1)[2:])) #.split("x")[1]
            lines[i] = line.split("#")[0]
            # print(lines[i])

    print(labels)

    # Zamiana adresów skoków na numery linii
    for i, line in enumerate(lines):
        for label, num in labels.items():
            lines[i] = lines[i].replace(label, f"{num}")

    # Usuwanie adresów docelowych
    lines = [line for line in lines if not line.strip().startswith("AD_")]

    result = '\n'.join(lines)
    return result

def load_opcodes(opcodes_file):
    opcodes = {}
    with open(opcodes_file, 'r') as file:
        for line in file:
            op, code = line.strip().split()
            opcodes[op] = code
    return opcodes

def compile_program(input_file, output_file, opcodes):
    with open(input_file, 'r') as input_file:
        program = input_file.read()

    lines = program.split('\n')
    filtered_lines = [line for line in lines if not line.strip().startswith("//") and line.strip() != ""]
    program = '\n'.join(filtered_lines)

    for op, code in opcodes.items():
        program = program.replace(op, code)
        program = program.replace(" ", "")

    program = process_jumps(program)

    with open(output_file, 'w') as output_file:
        output_file.write(program)

if __name__ == "__main__":
    opcodes_file = "./programs/prog_defines.txt"
    input_file = "./programs/prog.txt"
    output_file = "./programs/prog.bin"

    opcodes = load_opcodes(opcodes_file)
    compile_program(input_file, output_file, opcodes)

    print(f"Compilation complete. Result saved to {output_file}")


'''

C_ROUTINE    000B
C_RESET      000E
C_SET        0030
C_TIMER_DEC  0003
C_COMPARATOR 001D
C_COUNTER    0002
'''