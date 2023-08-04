all: slides-light.html

standalone: slides.html

slides-light.html: slides.md template.html
	pandoc -t dzslides \
	      --template template.html \
	      --highlight-style zenburn \
	       -s slides.md \
	       -o slides-light.html

slides.html: slides.md template.html
	pandoc -t dzslides \
	      --standalone \
	      --embed-resources \
	      --template template.html \
	      --highlight-style zenburn \
	      --metadata display-notes \
	       -s slides.md \
	       -o slides.html

clean:
	-rm slides.html
	-rm slides-light.html

upload:
	cellar s3 cp --acl public-read slides.html s3://clementd-files/adt-outscale.html