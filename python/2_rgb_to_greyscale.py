INPUT_HEX  = "../input.hex"
OUTPUT_HEX = "../output.hex"

WIDTH  = 2048
HEIGHT = 1365

BRIGHTNESS = 0


def clamp(val):
    return max(0, min(255, int(val)))

def read_hex_file(filename):
    with open(filename, "r") as f:
        return [line.strip() for line in f if line.strip()]

def write_hex_file(filename, data):
    with open(filename, "w") as f:
        for v in data:
            f.write(f"{v:02X}\n")

def main():
    hex_data = read_hex_file(INPUT_HEX)

    expected_lines = WIDTH * HEIGHT * 3
    assert len(hex_data) == expected_lines, \
        f"Sai kích thước dữ liệu: {len(hex_data)} dòng, cần {expected_lines}"

    output = []
    idx = 0

    for _ in range(WIDTH * HEIGHT):
        r = int(hex_data[idx], 16)
        g = int(hex_data[idx + 1], 16)
        b = int(hex_data[idx + 2], 16)
        idx += 3

        gray = (77 * r + 150 * g + 29 * b) >> 8

        gray = gray + BRIGHTNESS

        output.append(clamp(gray))

    write_hex_file(OUTPUT_HEX, output)
    print("✔ Đã tạo output.hex (greyscale) thành công")

if __name__ == "__main__":
    main()
