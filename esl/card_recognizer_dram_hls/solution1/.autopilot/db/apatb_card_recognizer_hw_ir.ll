; ModuleID = 'C:/Users/astan/Desktop/moj_esl/esl/esl/card_recognizer_dram_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<24>" = type { %"struct.ap_int_base<24, false>" }
%"struct.ap_int_base<24, false>" = type { %"struct.ssdm_int<24, false>" }
%"struct.ssdm_int<24, false>" = type { i24 }

; Function Attrs: noinline
define void @apatb_card_recognizer_hw_ir(%"struct.ap_uint<24>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="19200" %input_rgb, i32* noalias nocapture nonnull %result_rank, i32* noalias nocapture nonnull %result_suit, i32 %width, i32 %height) local_unnamed_addr #0 {
entry:
  %malloccall = call i8* @malloc(i64 76800)
  %input_rgb_copy = bitcast i8* %malloccall to [19200 x i24]*
  %result_rank_copy = alloca i32, align 512
  %result_suit_copy = alloca i32, align 512
  %0 = bitcast %"struct.ap_uint<24>"* %input_rgb to [19200 x %"struct.ap_uint<24>"]*
  call fastcc void @copy_in([19200 x %"struct.ap_uint<24>"]* nonnull %0, [19200 x i24]* %input_rgb_copy, i32* nonnull %result_rank, i32* nonnull align 512 %result_rank_copy, i32* nonnull %result_suit, i32* nonnull align 512 %result_suit_copy)
  %1 = getelementptr [19200 x i24], [19200 x i24]* %input_rgb_copy, i32 0, i32 0
  call void @apatb_card_recognizer_hw_hw(i24* %1, i32* %result_rank_copy, i32* %result_suit_copy, i32 %width, i32 %height)
  call void @copy_back([19200 x %"struct.ap_uint<24>"]* %0, [19200 x i24]* %input_rgb_copy, i32* %result_rank, i32* %result_rank_copy, i32* %result_suit, i32* %result_suit_copy)
  call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([19200 x %"struct.ap_uint<24>"]* noalias readonly "unpacked"="0", [19200 x i24]* noalias nocapture "unpacked"="1.0.0.0", i32* noalias readonly "unpacked"="2", i32* noalias align 512 "unpacked"="3", i32* noalias readonly "unpacked"="4", i32* noalias align 512 "unpacked"="5") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a19200struct.ap_uint<24>"([19200 x i24]* %1, [19200 x %"struct.ap_uint<24>"]* %0)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %3, i32* %2)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %5, i32* %4)
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
define internal fastcc void @copy_out([19200 x %"struct.ap_uint<24>"]* noalias "unpacked"="0", [19200 x i24]* noalias nocapture readonly "unpacked"="1.0.0.0", i32* noalias "unpacked"="2", i32* noalias readonly align 512 "unpacked"="3", i32* noalias "unpacked"="4", i32* noalias readonly align 512 "unpacked"="5") unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a19200struct.ap_uint<24>.59"([19200 x %"struct.ap_uint<24>"]* %0, [19200 x i24]* %1)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %2, i32* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a19200struct.ap_uint<24>.59"([19200 x %"struct.ap_uint<24>"]* noalias "unpacked"="0", [19200 x i24]* noalias nocapture readonly "unpacked"="1.0.0.0") unnamed_addr #2 {
entry:
  %2 = icmp eq [19200 x %"struct.ap_uint<24>"]* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [19200 x i24], [19200 x i24]* %1, i64 0, i64 %for.loop.idx1
  %dst.addr.0.0.06 = getelementptr [19200 x %"struct.ap_uint<24>"], [19200 x %"struct.ap_uint<24>"]* %0, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %3 = load i24, i24* %src.addr.0.0.05, align 4
  store i24 %3, i24* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 19200
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a19200struct.ap_uint<24>"([19200 x i24]* noalias nocapture "unpacked"="0.0.0.0", [19200 x %"struct.ap_uint<24>"]* noalias readonly "unpacked"="1") unnamed_addr #2 {
entry:
  %2 = icmp eq [19200 x %"struct.ap_uint<24>"]* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [19200 x %"struct.ap_uint<24>"], [19200 x %"struct.ap_uint<24>"]* %1, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [19200 x i24], [19200 x i24]* %0, i64 0, i64 %for.loop.idx1
  %3 = load i24, i24* %src.addr.0.0.05, align 4
  store i24 %3, i24* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 19200
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

declare void @apatb_card_recognizer_hw_hw(i24*, i32*, i32*, i32, i32)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([19200 x %"struct.ap_uint<24>"]* noalias "unpacked"="0", [19200 x i24]* noalias nocapture readonly "unpacked"="1.0.0.0", i32* noalias "unpacked"="2", i32* noalias readonly align 512 "unpacked"="3", i32* noalias "unpacked"="4", i32* noalias readonly align 512 "unpacked"="5") unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0i32(i32* %2, i32* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  ret void
}

define void @card_recognizer_hw_hw_stub_wrapper(i24*, i32*, i32*, i32, i32) #4 {
entry:
  %malloccall = tail call i8* @malloc(i64 76800)
  %5 = bitcast i8* %malloccall to [19200 x %"struct.ap_uint<24>"]*
  %6 = bitcast i24* %0 to [19200 x i24]*
  call void @copy_out([19200 x %"struct.ap_uint<24>"]* %5, [19200 x i24]* %6, i32* null, i32* %1, i32* null, i32* %2)
  %7 = bitcast [19200 x %"struct.ap_uint<24>"]* %5 to %"struct.ap_uint<24>"*
  call void @card_recognizer_hw_hw_stub(%"struct.ap_uint<24>"* %7, i32* %1, i32* %2, i32 %3, i32 %4)
  call void @copy_in([19200 x %"struct.ap_uint<24>"]* %5, [19200 x i24]* %6, i32* null, i32* %1, i32* null, i32* %2)
  ret void
}

declare void @card_recognizer_hw_hw_stub(%"struct.ap_uint<24>"*, i32*, i32*, i32, i32)

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
