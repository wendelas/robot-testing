--
-- Copyright (C) 2014 Ali Paikan (ali.paikan@gmail.com).
--
--   Redistribution and use in source and binary forms, with or without
--   modification, are permitted provided that the following conditions
--   are met:
--
--   Redistributions of source code must retain the above copyright
--   notice, this list of conditions and the following disclaimer.
--
--   Redistributions in binary form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the
--   distribution.
--
--   Neither the name of Texas Instruments Incorporated nor the names of
--   its contributors may be used to endorse or promote products derived
--   from this software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-- A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
-- OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-- LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-- DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-- THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-- OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-------------------------------------------------------------------------
with Interfaces.C;

package RTF.Asserter is
    procedure Error(Message : String);
    procedure ErrorIf(Condition : Boolean;
                      Message : String);

    procedure Fail(Message : String);
    procedure FailIf(Condition : Boolean;
                     Message : String);
                     
    procedure TestReport(Message : String);
    procedure TestCheck(Condition: Boolean;
                        Message : String);
    procedure TestFailIf(Condition: Boolean;
                        Message : String);

private       
    procedure TestReport_Wrapper(Message : Interfaces.C.char_array);
    pragma Import (C, TestReport_Wrapper, "rtf_test_report");

    procedure TestCheck_Wrapper(Condition : Interfaces.C.unsigned;
                                Message : Interfaces.C.char_array);
    pragma Import (C, TestCheck_Wrapper, "rtf_test_check");


    procedure TestFailIf_Wrapper(Condition : Interfaces.C.unsigned;
                                Message : Interfaces.C.char_array);
    pragma Import (C, TestFailIf_Wrapper, "rtf_test_fail_if");


    procedure Error_Wrapper(Message : Interfaces.C.char_array);
    pragma Import (C, Error_Wrapper, "rtf_assert_error");

    procedure Fail_Wrapper(Message : Interfaces.C.char_array);
    pragma Import (C, Fail_Wrapper, "rtf_assert_fail");

end RTF.Asserter;


