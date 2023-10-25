### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 75c3c7a9-2f01-4839-a5df-d7a964c7e2bf
using SHA

# ╔═╡ 55a9cecd-6e6b-48e8-943c-c19ecbe5a955
function passw_wordlist()
    passw_dict = Dict{String, String}()

    open("C:\\Users\\Jeetesh\\Desktop\\password_list.txt", "r") do inp
        for word in eachline(inp)
            for salt in 0:250
                salted_word = string(salt, lpad(word, 3, '0'))
                hash_bytes = sha256(salted_word)
                hash_hex = bytes2hex(hash_bytes)
                passw_dict[hash_hex] = word
            end
        end
    end

    return passw_dict
end

# ╔═╡ c7efdf7c-8f7c-41cb-a955-5d2d487ce8e8
function SHA_file()
    SHA_dict = Set{String}()

    open("C:\\Users\\Jeetesh\\Desktop\\formspring.txt", "r") do out
        for word in eachline(out)
            push!(SHA_dict, word)
        end
    end

    return SHA_dict
end

# ╔═╡ 723ba4d7-6e58-42fc-a4a0-d105c2d36f43
function main()
    passw_dict = passw_wordlist()
    SHA_dict = SHA_file()
    final_passwords = Dict{String, String}()

    for hash_value in SHA_dict
        if haskey(passw_dict, hash_value)
            final_passwords[hash_value] = passw_dict[hash_value]
        end
    end

    open("C:\\Users\\Jeetesh\\Desktop\\j.txt", "a") do output_file
        for (hash_value, password) in final_passwords
            println(output_file, "$hash_value $password")
        end
    end
end

# ╔═╡ ab70c9ec-067f-4378-af47-13b306f207f2
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
# ╠═75c3c7a9-2f01-4839-a5df-d7a964c7e2bf
# ╠═55a9cecd-6e6b-48e8-943c-c19ecbe5a955
# ╠═c7efdf7c-8f7c-41cb-a955-5d2d487ce8e8
# ╠═723ba4d7-6e58-42fc-a4a0-d105c2d36f43
# ╠═ab70c9ec-067f-4378-af47-13b306f207f2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
