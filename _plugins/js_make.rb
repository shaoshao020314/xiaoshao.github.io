module Jekyll
	class JsGenerator < Generator
		safe true
		priority :low

		def generate(site)
			src = "lines.txt"
			dst = "motdSelector.js"

			# add new file to the list of static files
			site.static_files.push(JsFile.new(site, site.source, "js", src, dst))
		end
	end

	class JsFile < StaticFile
		def initialize(site, base, dir, name, dst)
			super(site, base, dir, name, nil)

			@srcName = File.join(base, dir, name)
			@dir = dir
			@dst = dst
		end

		def write(dest)
			dstPath = File.join(dest, @dir)
			dstName = File.join(dstPath, @dst)

			# make sure dir exists
			FileUtils.mkdir_p(dstPath)

			js = File.open(dstName, 'w')

			js.puts "var quoteArr = [];"
			js.puts "$(function() {"

			txt = File.open(@srcName, 'r')
			txt.readlines.each do |line|
				js.puts "\tquoteArr.push('&#12300; " + line.strip + " &#12301;');"
			end
			txt.close

			js.puts "\tsetMotd();"
			js.puts "});"

			js.puts "function setMotd() {"
			js.puts "\tvar index = Math.floor((Math.random() * quoteArr.length));"
			js.puts "\t$('#motd').html(quoteArr[index]);"
			js.puts "}"

			js.close

			puts js
		end
	end

end