from PIL import Image

INPUT_HEX  = "../verilog.hex"
OUTPUT_BMP = "../output.bmp"

WIDTH  = 2048
HEIGHT = 1365


def clamp(val):
    return max(0, min(255, int(val)))


def read_hex_file(filename):
    with open(filename, "r") as f:
        return [line.strip() for line in f if line.strip()]


def main():
    hex_data = read_hex_file(INPUT_HEX)

    expected_pixels = WIDTH * HEIGHT
    assert len(hex_data) == expected_pixels, \
        f"Sai kích thước dữ liệu: {len(hex_data)} dòng, cần {expected_pixels}"

    img = Image.new("L", (WIDTH, HEIGHT))
    pixels = img.load()

    idx = 0
    for y in range(HEIGHT):
        for x in range(WIDTH):
            gray = int(hex_data[idx], 16)
            pixels[x, y] = clamp(gray)
            idx += 1

    img.save(OUTPUT_BMP)
    print("✔ Đã tạo output.bmp thành công")


if __name__ == "__main__":
    main()
