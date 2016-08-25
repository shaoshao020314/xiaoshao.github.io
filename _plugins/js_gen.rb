module Jekyll
	class JsGenerator < Generator
		safe true
		priority :low

		def generate(site)
			src = "_plugins/resources/lines.txt"
			dst = "js/motdSelector.js"

			# add new file to the list of static files
			site.static_files.push(JsFile.new(site, site.source, "", src, dst))
		end
	end

	class JsFile < StaticFile
		def initialize(site, base, dir, name, dst)
			super(site, base, dir, name, nil)

			@srcName = File.join(base, name)
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
				js.puts "\tquoteArr.push('" + line.strip + "');"
			end
			txt.close

			js.puts "\tsetMotd();"
			js.puts "});"

			js.puts "function setMotd() {"
			js.puts "\tvar index = Math.floor((Math.random() * quoteArr.length));"
			js.puts "\t$('#motd').html('&#12300; ' + quoteArr[index] + ' &#12301;');"
			js.puts "}"

			js.close

			puts js
		end
	end

end
