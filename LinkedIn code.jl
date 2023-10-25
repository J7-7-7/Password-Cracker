### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ d98ba238-3024-4adb-82b8-01ccf0515b41
using SHA

# ╔═╡ 9b5126a0-7f9d-499e-af63-66955c6e1bc3
function passw_wordlist(filename)
    passw_dict = Dict{String, String}()
    open(filename, "r") do file
        for word in eachline(file)
            passw_hash = sha1(word)
            hash = "00000$(bytes2hex(passw_hash)[6:end])"
            passw_dict[hash] = word
        end
    end
    return passw_dict
end

# ╔═╡ 684738cf-77eb-4307-921d-6e1862a77597
function SHA_file(filename)
    SHA_dict = Set{String}()
    open(filename, "r") do file
        for word in eachline(file)
            push!(SHA_dict, word)
        end
    end
    return SHA_dict
end

# ╔═╡ 1c4ec0e7-2a1d-48e6-be44-7e099593ac79
function main()
    passw_dict = passw_wordlist("C:\\Users\\Jeetesh\\Desktop\\password_list.txt")
    SHA_dict = SHA_file("C:\\Users\\Jeetesh\\Desktop\\SHA1.txt")
    
    output = "C:\\Users\\Jeetesh\\Desktop\\a.txt"
    
    open(output, "a") do output_file
        for hash_value in SHA_dict
            if haskey(passw_dict, hash_value)
                original_password = passw_dict[hash_value]
                println(output_file, "$hash_value $original_password")
            end
        end
    end
end

# ╔═╡ ddef2daa-dedf-4dda-aade-2c69da97b2de
main()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
SHA = "ea8e919c-243c-51af-8825-aaa63cd721ce"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "6a2bc76e9b3bd74644517927c755c3c99df132b2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"
"""

# ╔═╡ Cell order:
# ╠═d98ba238-3024-4adb-82b8-01ccf0515b41
# ╠═9b5126a0-7f9d-499e-af63-66955c6e1bc3
# ╠═684738cf-77eb-4307-921d-6e1862a77597
# ╠═1c4ec0e7-2a1d-48e6-be44-7e099593ac79
# ╠═ddef2daa-dedf-4dda-aade-2c69da97b2de
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
