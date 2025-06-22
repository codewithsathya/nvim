return {
    {
        "CRAG666/code_runner.nvim",
        config = true,
        opts = {
            mode = "toggleterm",
            filetype = {
                javascript = "node",
                java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
                python = "python -u '$dir/$fileName'",
                sh = "bash",
                cpp = {
                    "cd $dir &&",
                    "g++-15 -std=c++20 -I/Users/codewithsathya/Desktop/cp/other/cp-headers $fileName",
                    "-o /tmp/$fileNameWithoutExt &&",
                    "/tmp/$fileNameWithoutExt",
                },
                go = "go run $fileName"
            },
        },
    },
}
