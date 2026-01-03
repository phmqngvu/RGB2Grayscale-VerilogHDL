from PIL import Image

INPUT_BMP = "input.bmp"
OUTPUT_HEX = "rgb.hex"

# Open image and force RGB
img = Image.open(INPUT_BMP).convert("RGB")
width, height = img.size
pixels = img.load()

with open(OUTPUT_HEX, "w") as f:
    for y in range(height):
        for x in range(width):
            r, g, b = pixels[x, y]

            # Write each channel on a separate line (hex)
            f.write(f"{r:02X}\n")
            f.write(f"{g:02X}\n")
            f.write(f"{b:02X}\n")

print(f"Done! {width}x{height} pixels written to {OUTPUT_HEX}")