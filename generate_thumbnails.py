import os, sys
from PIL import Image # Developed with Pillow 3.2.0, which masquerades as PIL
rootdir = sys.argv[1]

for subdir, dirs, files in os.walk(rootdir):
    for file in files:
        fp = os.path.join(subdir, file)
        try:
            with Image.open(fp) as im:
                if im.format in ["JPEG", "PNG"]:
                    im.thumbnail((750,750))
                    output_path = os.path.join(subdir, "thumbnail_750px_" + file)
                    print(fp)
                    print(output_path)
                    im.save(output_path, im.format)
                else:
                    print("Skipping image {0}".format(fp))
        except IOError:
            print("Skipping {0}".format(fp))