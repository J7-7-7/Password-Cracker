### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ a9e0f380-5584-11ee-2cfb-571a89e0753e
function yahoo(input_file::String, output_file::String)
    open(input_file, "r") do file
        open(output_file, "w") do output
            for word in eachline(file)
                a = split(word, ':')

                if length(a) >= 3
                    output_line = string(a[1], ":", a[2], ":", a[3], " ", a[3], "\n")
                    write(output, output_line)
                end
            end
        end
    end
end



# ╔═╡ 3fe4a61b-b076-4d15-91ad-86e67bd3540e
function main()
    input_file = "C:\\Users\\Jeetesh\\Desktop\\Yahoo 100.txt"
    output_file = "C:\\Users\\Jeetesh\\Desktop\\a.txt"
    yahoo(input_file, output_file)
end

# ╔═╡ 7f095fe7-6509-49ee-8930-c946a59aa008
main()

# ╔═╡ Cell order:
# ╠═a9e0f380-5584-11ee-2cfb-571a89e0753e
# ╠═3fe4a61b-b076-4d15-91ad-86e67bd3540e
# ╠═7f095fe7-6509-49ee-8930-c946a59aa008
