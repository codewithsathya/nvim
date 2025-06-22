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
                    "g++ -std=c++20 $fileName",
                    "-o /tmp/$fileNameWithoutExt &&",
                    "/tmp/$fileNameWithoutExt",
                },
                go = "go run $fileName"
            },
        },
    },
}
