; ModuleID = 'C:/Users/astan/Desktop/moj_esl/esl/esl/card_recognizer_dram_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_card_recognizer_hw_ir(i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="230400" %input_rgb, i8* noalias nocapture nonnull "fpga.decayed.dim.hint"="76800" %gray, i8* noalias nocapture nonnull "fpga.decayed.dim.hint"="76800" %binary, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="76800" %visited, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="76800" %queue_x, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="76800" %queue_y, i32* noalias nocapture nonnull %result_rank, i32* noalias nocapture nonnull %result_suit, i32 %width, i32 %height) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 230400)
  %input_rgb_copy = bitcast i8* %malloccall to [230400 x i8]*
  %malloccall1 = tail call i8* @malloc(i64 76800)
  %gray_copy = bitcast i8* %malloccall1 to [76800 x i8]*
  %malloccall2 = tail call i8* @malloc(i64 76800)
  %binary_copy = bitcast i8* %malloccall2 to [76800 x i8]*
  %malloccall3 = tail call i8* @malloc(i64 307200)
  %visited_copy = bitcast i8* %malloccall3 to [76800 x i32]*
  %malloccall4 = tail call i8* @malloc(i64 307200)
  %queue_x_copy = bitcast i8* %malloccall4 to [76800 x i32]*
  %malloccall5 = tail call i8* @malloc(i64 307200)
  %queue_y_copy = bitcast i8* %malloccall5 to [76800 x i32]*
  %result_rank_copy = alloca i32, align 512
  %result_suit_copy = alloca i32, align 512
  %0 = bitcast i8* %input_rgb to [230400 x i8]*
  %1 = bitcast i8* %gray to [76800 x i8]*
  %2 = bitcast i8* %binary to [76800 x i8]*
  %3 = bitcast i32* %visited to [76800 x i32]*
  %4 = bitcast i32* %queue_x to [76800 x i32]*
  %5 = bitcast i32* %queue_y to [76800 x i32]*
  call fastcc void @copy_in([230400 x i8]* nonnull %0, [230400 x i8]* %input_rgb_copy, [76800 x i8]* nonnull %1, [76800 x i8]* %gray_copy, [76800 x i8]* nonnull %2, [76800 x i8]* %binary_copy, [76800 x i32]* nonnull %3, [76800 x i32]* %visited_copy, [76800 x i32]* nonnull %4, [76800 x i32]* %queue_x_copy, [76800 x i32]* nonnull %5, [76800 x i32]* %queue_y_copy, i32* nonnull %result_rank, i32* nonnull align 512 %result_rank_copy, i32* nonnull %result_suit, i32* nonnull align 512 %result_suit_copy)
  %6 = getelementptr inbounds [76800 x i32], [76800 x i32]* %visited_copy, i32 0, i32 0
  %7 = getelementptr inbounds [76800 x i32], [76800 x i32]* %queue_x_copy, i32 0, i32 0
  %8 = getelementptr inbounds [76800 x i32], [76800 x i32]* %queue_y_copy, i32 0, i32 0
  call void @apatb_card_recognizer_hw_hw(i8* %malloccall, i8* %malloccall1, i8* %malloccall2, i32* %6, i32* %7, i32* %8, i32* %result_rank_copy, i32* %result_suit_copy, i32 %width, i32 %height)
  call void @copy_back([230400 x i8]* %0, [230400 x i8]* %input_rgb_copy, [76800 x i8]* %1, [76800 x i8]* %gray_copy, [76800 x i8]* %2, [76800 x i8]* %binary_copy, [76800 x i32]* %3, [76800 x i32]* %visited_copy, [76800 x i32]* %4, [76800 x i32]* %queue_x_copy, [76800 x i32]* %5, [76800 x i32]* %queue_y_copy, i32* %result_rank, i32* %result_rank_copy, i32* %result_suit, i32* %result_suit_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  tail call void @free(i8* %malloccall3)
  tail call void @free(i8* %malloccall4)
  tail call void @free(i8* %malloccall5)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([230400 x i8]* noalias readonly, [230400 x i8]* noalias, [76800 x i8]* noalias readonly, [76800 x i8]* noalias, [76800 x i8]* noalias readonly, [76800 x i8]* noalias, [76800 x i32]* noalias readonly, [76800 x i32]* noalias, [76800 x i32]* noalias readonly, [76800 x i32]* noalias, [76800 x i32]* noalias readonly, [76800 x i32]* noalias, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a230400i8([230400 x i8]* %1, [230400 x i8]* %0)
  call fastcc void @onebyonecpy_hls.p0a76800i8([76800 x i8]* %3, [76800 x i8]* %2)
  call fastcc void @onebyonecpy_hls.p0a76800i8([76800 x i8]* %5, [76800 x i8]* %4)
  call fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* %7, [76800 x i32]* %6)
  call fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* %9, [76800 x i32]* %8)
  call fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* %11, [76800 x i32]* %10)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %13, i32* %12)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %15, i32* %14)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a230400i8([230400 x i8]* noalias, [230400 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [230400 x i8]* %0, null
  %3 = icmp eq [230400 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [230400 x i8], [230400 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [230400 x i8], [230400 x i8]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i8, i8* %src.addr, align 1
  store i8 %5, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 230400
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a76800i8([76800 x i8]* noalias, [76800 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [76800 x i8]* %0, null
  %3 = icmp eq [76800 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [76800 x i8], [76800 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [76800 x i8], [76800 x i8]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i8, i8* %src.addr, align 1
  store i8 %5, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 76800
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* noalias, [76800 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [76800 x i32]* %0, null
  %3 = icmp eq [76800 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [76800 x i32], [76800 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [76800 x i32], [76800 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 76800
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512, i32* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i32* %0, null
  %3 = icmp eq i32* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = load i32, i32* %1, align 4
  store i32 %5, i32* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([230400 x i8]* noalias, [230400 x i8]* noalias readonly, [76800 x i8]* noalias, [76800 x i8]* noalias readonly, [76800 x i8]* noalias, [76800 x i8]* noalias readonly, [76800 x i32]* noalias, [76800 x i32]* noalias readonly, [76800 x i32]* noalias, [76800 x i32]* noalias readonly, [76800 x i32]* noalias, [76800 x i32]* noalias readonly, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a230400i8([230400 x i8]* %0, [230400 x i8]* %1)
  call fastcc void @onebyonecpy_hls.p0a76800i8([76800 x i8]* %2, [76800 x i8]* %3)
  call fastcc void @onebyonecpy_hls.p0a76800i8([76800 x i8]* %4, [76800 x i8]* %5)
  call fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* %6, [76800 x i32]* %7)
  call fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* %8, [76800 x i32]* %9)
  call fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* %10, [76800 x i32]* %11)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %12, i32* align 512 %13)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %14, i32* align 512 %15)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_card_recognizer_hw_hw(i8*, i8*, i8*, i32*, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([230400 x i8]* noalias, [230400 x i8]* noalias readonly, [76800 x i8]* noalias, [76800 x i8]* noalias readonly, [76800 x i8]* noalias, [76800 x i8]* noalias readonly, [76800 x i32]* noalias, [76800 x i32]* noalias readonly, [76800 x i32]* noalias, [76800 x i32]* noalias readonly, [76800 x i32]* noalias, [76800 x i32]* noalias readonly, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a76800i8([76800 x i8]* %2, [76800 x i8]* %3)
  call fastcc void @onebyonecpy_hls.p0a76800i8([76800 x i8]* %4, [76800 x i8]* %5)
  call fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* %6, [76800 x i32]* %7)
  call fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* %8, [76800 x i32]* %9)
  call fastcc void @onebyonecpy_hls.p0a76800i32([76800 x i32]* %10, [76800 x i32]* %11)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %12, i32* align 512 %13)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %14, i32* align 512 %15)
  ret void
}

define void @card_recognizer_hw_hw_stub_wrapper(i8*, i8*, i8*, i32*, i32*, i32*, i32*, i32*, i32, i32) #4 {
entry:
  %10 = bitcast i8* %0 to [230400 x i8]*
  %11 = bitcast i8* %1 to [76800 x i8]*
  %12 = bitcast i8* %2 to [76800 x i8]*
  %13 = bitcast i32* %3 to [76800 x i32]*
  %14 = bitcast i32* %4 to [76800 x i32]*
  %15 = bitcast i32* %5 to [76800 x i32]*
  call void @copy_out([230400 x i8]* null, [230400 x i8]* %10, [76800 x i8]* null, [76800 x i8]* %11, [76800 x i8]* null, [76800 x i8]* %12, [76800 x i32]* null, [76800 x i32]* %13, [76800 x i32]* null, [76800 x i32]* %14, [76800 x i32]* null, [76800 x i32]* %15, i32* null, i32* %6, i32* null, i32* %7)
  %16 = bitcast [230400 x i8]* %10 to i8*
  %17 = bitcast [76800 x i8]* %11 to i8*
  %18 = bitcast [76800 x i8]* %12 to i8*
  %19 = bitcast [76800 x i32]* %13 to i32*
  %20 = bitcast [76800 x i32]* %14 to i32*
  %21 = bitcast [76800 x i32]* %15 to i32*
  call void @card_recognizer_hw_hw_stub(i8* %16, i8* %17, i8* %18, i32* %19, i32* %20, i32* %21, i32* %6, i32* %7, i32 %8, i32 %9)
  call void @copy_in([230400 x i8]* null, [230400 x i8]* %10, [76800 x i8]* null, [76800 x i8]* %11, [76800 x i8]* null, [76800 x i8]* %12, [76800 x i32]* null, [76800 x i32]* %13, [76800 x i32]* null, [76800 x i32]* %14, [76800 x i32]* null, [76800 x i32]* %15, i32* null, i32* %6, i32* null, i32* %7)
  ret void
}

declare void @card_recognizer_hw_hw_stub(i8*, i8*, i8*, i32*, i32*, i32*, i32*, i32*, i32, i32)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
