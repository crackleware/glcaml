/*
 * GLCaml - Objective Caml interface for OpenGL 1.1, 1.2, 1.3, 1.4, 1.5, 2.0 and 2.1
 * plus extensions:
 *
 * Copyright (C) 2007, 2008 Elliott OTI
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided
 * that the following conditions are met:
 *  - Redistributions of source code must retain the above copyright notice, this list of conditions
 *    and the following disclaimer.
 *  - Redistributions in binary form must reproduce the above copyright notice, this list of conditions
 *    and the following disclaimer in the documentation and/or other materials provided with the distribution.
 *  - The name Elliott Oti may not be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdio.h>
#include <string.h>

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/callback.h>
#include <caml/bigarray.h>

typedef unsigned int GLenum;
typedef unsigned char GLboolean;
typedef unsigned int GLbitfield;
typedef void GLvoid;
typedef char GLbyte;
typedef short GLshort;
typedef int GLint;
typedef unsigned char GLubyte;
typedef unsigned short GLushort;
typedef unsigned int GLuint;
typedef int GLsizei;
typedef float GLfloat;
typedef float GLclampf;
typedef double GLdouble;
typedef double GLclampd;
typedef char GLchar;
typedef ptrdiff_t GLsizeiptr;
typedef ptrdiff_t GLintptr;
typedef char* GLstring;

#ifdef _WIN32
#include <windows.h>

static HMODULE lib=NULL;

static void init_lib()
{
        if(lib)return;
        lib = LoadLibrary("opengl32.dll");
        if(lib == NULL) failwith("error loading opengl32.dll");
}

static void *get_proc_address(char *fname)
{
        return GetProcAddress(lib, fname);
}

#endif

#ifdef __unix__
#ifndef APIENTRY
#define APIENTRY
#endif
#include <dlfcn.h>
#include <stdio.h>

static void* lib=NULL;

static void init_lib()
{
        if(lib)return;
        lib = dlopen("libGL.so.1",RTLD_LAZY);
        if(lib == NULL) failwith("error loading libGL.so.1");
}

static void *get_proc_address(char *fname)
{
        return dlsym(lib, fname);
}

#endif

#if defined(__APPLE__) && defined(__GNUC__)
#ifndef APIENTRY
#define APIENTRY
#endif
#include <dlfcn.h>
#include <stdio.h>

static void* lib=NULL;

static void init_lib()
{
        if(lib)return;
        lib = dlopen("libGL.dylib",RTLD_LAZY);
        if(lib == NULL) lib = dlopen("/System/Library/Frameworks/OpenGL.framework/Libraries/libGL.dylib", RTLD_LAZY);
        if(lib == NULL) failwith("error loading libGL.dylib");
}

static void *get_proc_address(char *fname)
{
        return dlsym(lib, fname);
}
#endif

value unsafe_coercion(value v)
{
        CAMLparam1(v);
        CAMLreturn(v);
}


#define DECLARE_FUNCTION(func, args, ret)                               \
typedef ret APIENTRY (*pstub_##func)args;                               \
static pstub_##func stub_##func = NULL;                                 \
static int loaded_##func = 0;



#define LOAD_FUNCTION(func)                                             \
        if(!loaded_##func)                                              \
        {                                                               \
                init_lib ();                                            \
                stub_##func = (pstub_##func)get_proc_address(#func);    \
                if(stub_##func)                                         \
                {                                                       \
                        loaded_##func = 1;                              \
                }                                                       \
                else                                                    \
                {                                                       \
                        char fn[256], buf[300];                         \
                        strncpy(fn, #func, 255);                        \
                        sprintf(buf, "Unable to load %s", fn);          \
                        caml_failwith(buf);                             \
                }                                                       \
        }



DECLARE_FUNCTION(glActiveTexture,(GLenum),void);
value glstub_glActiveTexture(value v0)
{
	CAMLparam1(v0);
	GLenum lv0 = Int_val(v0);
	LOAD_FUNCTION(glActiveTexture);
	(*stub_glActiveTexture)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glAttachShader,(GLuint, GLuint),void);
value glstub_glAttachShader(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLuint lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	LOAD_FUNCTION(glAttachShader);
	(*stub_glAttachShader)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBindAttribLocation,(GLuint, GLuint, GLchar*),void);
value glstub_glBindAttribLocation(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLuint lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	GLchar* lv2 = String_val(v2);
	LOAD_FUNCTION(glBindAttribLocation);
	(*stub_glBindAttribLocation)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBindBuffer,(GLenum, GLuint),void);
value glstub_glBindBuffer(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	LOAD_FUNCTION(glBindBuffer);
	(*stub_glBindBuffer)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBindFramebuffer,(GLenum, GLuint),void);
value glstub_glBindFramebuffer(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	LOAD_FUNCTION(glBindFramebuffer);
	(*stub_glBindFramebuffer)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBindRenderbuffer,(GLenum, GLuint),void);
value glstub_glBindRenderbuffer(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	LOAD_FUNCTION(glBindRenderbuffer);
	(*stub_glBindRenderbuffer)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBindTexture,(GLenum, GLuint),void);
value glstub_glBindTexture(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	LOAD_FUNCTION(glBindTexture);
	(*stub_glBindTexture)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBlendColor,(GLclampf, GLclampf, GLclampf, GLclampf),void);
value glstub_glBlendColor(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLclampf lv0 = Double_val(v0);
	GLclampf lv1 = Double_val(v1);
	GLclampf lv2 = Double_val(v2);
	GLclampf lv3 = Double_val(v3);
	LOAD_FUNCTION(glBlendColor);
	(*stub_glBlendColor)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBlendEquation,(GLenum),void);
value glstub_glBlendEquation(value v0)
{
	CAMLparam1(v0);
	GLenum lv0 = Int_val(v0);
	LOAD_FUNCTION(glBlendEquation);
	(*stub_glBlendEquation)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBlendEquationSeparate,(GLenum, GLenum),void);
value glstub_glBlendEquationSeparate(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	LOAD_FUNCTION(glBlendEquationSeparate);
	(*stub_glBlendEquationSeparate)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBlendFunc,(GLenum, GLenum),void);
value glstub_glBlendFunc(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	LOAD_FUNCTION(glBlendFunc);
	(*stub_glBlendFunc)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBlendFuncSeparate,(GLenum, GLenum, GLenum, GLenum),void);
value glstub_glBlendFuncSeparate(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	GLenum lv3 = Int_val(v3);
	LOAD_FUNCTION(glBlendFuncSeparate);
	(*stub_glBlendFuncSeparate)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBufferData,(GLenum, GLsizeiptr, GLvoid*, GLenum),void);
value glstub_glBufferData(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLsizeiptr lv1 = Int_val(v1);
	GLvoid* lv2 = (Is_long(v2) ? (GLvoid*)Long_val(v2) : ((Tag_val(v2) == String_tag)? (String_val(v2)) : (Data_bigarray_val(v2))));
	GLenum lv3 = Int_val(v3);
	LOAD_FUNCTION(glBufferData);
	(*stub_glBufferData)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glBufferSubData,(GLenum, GLintptr, GLsizeiptr, GLvoid*),void);
value glstub_glBufferSubData(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLintptr lv1 = Int_val(v1);
	GLsizeiptr lv2 = Int_val(v2);
	GLvoid* lv3 = (Is_long(v3) ? (GLvoid*)Long_val(v3) : ((Tag_val(v3) == String_tag)? (String_val(v3)) : (Data_bigarray_val(v3))));
	LOAD_FUNCTION(glBufferSubData);
	(*stub_glBufferSubData)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glCheckFramebufferStatus,(GLenum),GLenum);
value glstub_glCheckFramebufferStatus(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLenum lv0 = Int_val(v0);
	GLenum ret;
	LOAD_FUNCTION(glCheckFramebufferStatus);
	ret = (*stub_glCheckFramebufferStatus)(lv0);
	result = Val_int(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glClear,(GLbitfield),void);
value glstub_glClear(value v0)
{
	CAMLparam1(v0);
	GLbitfield lv0 = Int_val(v0);
	LOAD_FUNCTION(glClear);
	(*stub_glClear)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glClearColor,(GLclampf, GLclampf, GLclampf, GLclampf),void);
value glstub_glClearColor(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLclampf lv0 = Double_val(v0);
	GLclampf lv1 = Double_val(v1);
	GLclampf lv2 = Double_val(v2);
	GLclampf lv3 = Double_val(v3);
	LOAD_FUNCTION(glClearColor);
	(*stub_glClearColor)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glClearDepthf,(GLclampf),void);
value glstub_glClearDepthf(value v0)
{
	CAMLparam1(v0);
	GLclampf lv0 = Double_val(v0);
	LOAD_FUNCTION(glClearDepthf);
	(*stub_glClearDepthf)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glClearStencil,(GLint),void);
value glstub_glClearStencil(value v0)
{
	CAMLparam1(v0);
	GLint lv0 = Int_val(v0);
	LOAD_FUNCTION(glClearStencil);
	(*stub_glClearStencil)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glColorMask,(GLboolean, GLboolean, GLboolean, GLboolean),void);
value glstub_glColorMask(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLboolean lv0 = Bool_val(v0);
	GLboolean lv1 = Bool_val(v1);
	GLboolean lv2 = Bool_val(v2);
	GLboolean lv3 = Bool_val(v3);
	LOAD_FUNCTION(glColorMask);
	(*stub_glColorMask)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glCompileShader,(GLuint),void);
value glstub_glCompileShader(value v0)
{
	CAMLparam1(v0);
	GLuint lv0 = Int_val(v0);
	LOAD_FUNCTION(glCompileShader);
	(*stub_glCompileShader)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glCompressedTexImage2D,(GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, GLvoid*),void);
value glstub_glCompressedTexImage2D(value v0, value v1, value v2, value v3, value v4, value v5, value v6, value v7)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam3(v5, v6, v7);
	GLenum lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	GLsizei lv3 = Int_val(v3);
	GLsizei lv4 = Int_val(v4);
	GLint lv5 = Int_val(v5);
	GLsizei lv6 = Int_val(v6);
	GLvoid* lv7 = (Is_long(v7) ? (GLvoid*)Long_val(v7) : ((Tag_val(v7) == String_tag)? (String_val(v7)) : (Data_bigarray_val(v7))));
	LOAD_FUNCTION(glCompressedTexImage2D);
	(*stub_glCompressedTexImage2D)(lv0, lv1, lv2, lv3, lv4, lv5, lv6, lv7);
	CAMLreturn(Val_unit);
}

value glstub_glCompressedTexImage2D_byte(value * argv, int n)
{
	return glstub_glCompressedTexImage2D(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

DECLARE_FUNCTION(glCompressedTexSubImage2D,(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, GLvoid*),void);
value glstub_glCompressedTexSubImage2D(value v0, value v1, value v2, value v3, value v4, value v5, value v6, value v7, value v8)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam4(v5, v6, v7, v8);
	GLenum lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLint lv2 = Int_val(v2);
	GLint lv3 = Int_val(v3);
	GLsizei lv4 = Int_val(v4);
	GLsizei lv5 = Int_val(v5);
	GLenum lv6 = Int_val(v6);
	GLsizei lv7 = Int_val(v7);
	GLvoid* lv8 = (Is_long(v8) ? (GLvoid*)Long_val(v8) : ((Tag_val(v8) == String_tag)? (String_val(v8)) : (Data_bigarray_val(v8))));
	LOAD_FUNCTION(glCompressedTexSubImage2D);
	(*stub_glCompressedTexSubImage2D)(lv0, lv1, lv2, lv3, lv4, lv5, lv6, lv7, lv8);
	CAMLreturn(Val_unit);
}

value glstub_glCompressedTexSubImage2D_byte(value * argv, int n)
{
	return glstub_glCompressedTexSubImage2D(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

DECLARE_FUNCTION(glCopyTexImage2D,(GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLsizei, GLint),void);
value glstub_glCopyTexImage2D(value v0, value v1, value v2, value v3, value v4, value v5, value v6, value v7)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam3(v5, v6, v7);
	GLenum lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	GLint lv3 = Int_val(v3);
	GLint lv4 = Int_val(v4);
	GLsizei lv5 = Int_val(v5);
	GLsizei lv6 = Int_val(v6);
	GLint lv7 = Int_val(v7);
	LOAD_FUNCTION(glCopyTexImage2D);
	(*stub_glCopyTexImage2D)(lv0, lv1, lv2, lv3, lv4, lv5, lv6, lv7);
	CAMLreturn(Val_unit);
}

value glstub_glCopyTexImage2D_byte(value * argv, int n)
{
	return glstub_glCopyTexImage2D(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

DECLARE_FUNCTION(glCopyTexSubImage2D,(GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei),void);
value glstub_glCopyTexSubImage2D(value v0, value v1, value v2, value v3, value v4, value v5, value v6, value v7)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam3(v5, v6, v7);
	GLenum lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLint lv2 = Int_val(v2);
	GLint lv3 = Int_val(v3);
	GLint lv4 = Int_val(v4);
	GLint lv5 = Int_val(v5);
	GLsizei lv6 = Int_val(v6);
	GLsizei lv7 = Int_val(v7);
	LOAD_FUNCTION(glCopyTexSubImage2D);
	(*stub_glCopyTexSubImage2D)(lv0, lv1, lv2, lv3, lv4, lv5, lv6, lv7);
	CAMLreturn(Val_unit);
}

value glstub_glCopyTexSubImage2D_byte(value * argv, int n)
{
	return glstub_glCopyTexSubImage2D(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

DECLARE_FUNCTION(glCreateProgram,(void),GLuint);
value glstub_glCreateProgram(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLuint ret;
	LOAD_FUNCTION(glCreateProgram);
	ret = (*stub_glCreateProgram)();
	result = Val_int(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glCreateShader,(GLenum),GLuint);
value glstub_glCreateShader(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLenum lv0 = Int_val(v0);
	GLuint ret;
	LOAD_FUNCTION(glCreateShader);
	ret = (*stub_glCreateShader)(lv0);
	result = Val_int(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glCullFace,(GLenum),void);
value glstub_glCullFace(value v0)
{
	CAMLparam1(v0);
	GLenum lv0 = Int_val(v0);
	LOAD_FUNCTION(glCullFace);
	(*stub_glCullFace)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDeleteBuffers,(GLsizei, GLuint*),void);
value glstub_glDeleteBuffers(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLsizei lv0 = Int_val(v0);
	GLuint* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glDeleteBuffers);
	(*stub_glDeleteBuffers)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDeleteFramebuffers,(GLsizei, GLuint*),void);
value glstub_glDeleteFramebuffers(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLsizei lv0 = Int_val(v0);
	GLuint* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glDeleteFramebuffers);
	(*stub_glDeleteFramebuffers)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDeleteProgram,(GLuint),void);
value glstub_glDeleteProgram(value v0)
{
	CAMLparam1(v0);
	GLuint lv0 = Int_val(v0);
	LOAD_FUNCTION(glDeleteProgram);
	(*stub_glDeleteProgram)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDeleteRenderbuffers,(GLsizei, GLuint*),void);
value glstub_glDeleteRenderbuffers(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLsizei lv0 = Int_val(v0);
	GLuint* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glDeleteRenderbuffers);
	(*stub_glDeleteRenderbuffers)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDeleteShader,(GLuint),void);
value glstub_glDeleteShader(value v0)
{
	CAMLparam1(v0);
	GLuint lv0 = Int_val(v0);
	LOAD_FUNCTION(glDeleteShader);
	(*stub_glDeleteShader)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDeleteTextures,(GLsizei, GLuint*),void);
value glstub_glDeleteTextures(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLsizei lv0 = Int_val(v0);
	GLuint* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glDeleteTextures);
	(*stub_glDeleteTextures)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDepthFunc,(GLenum),void);
value glstub_glDepthFunc(value v0)
{
	CAMLparam1(v0);
	GLenum lv0 = Int_val(v0);
	LOAD_FUNCTION(glDepthFunc);
	(*stub_glDepthFunc)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDepthMask,(GLboolean),void);
value glstub_glDepthMask(value v0)
{
	CAMLparam1(v0);
	GLboolean lv0 = Bool_val(v0);
	LOAD_FUNCTION(glDepthMask);
	(*stub_glDepthMask)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDepthRangef,(GLclampf, GLclampf),void);
value glstub_glDepthRangef(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLclampf lv0 = Double_val(v0);
	GLclampf lv1 = Double_val(v1);
	LOAD_FUNCTION(glDepthRangef);
	(*stub_glDepthRangef)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDetachShader,(GLuint, GLuint),void);
value glstub_glDetachShader(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLuint lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	LOAD_FUNCTION(glDetachShader);
	(*stub_glDetachShader)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDisable,(GLenum),void);
value glstub_glDisable(value v0)
{
	CAMLparam1(v0);
	GLenum lv0 = Int_val(v0);
	LOAD_FUNCTION(glDisable);
	(*stub_glDisable)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDisableVertexAttribArray,(GLuint),void);
value glstub_glDisableVertexAttribArray(value v0)
{
	CAMLparam1(v0);
	GLuint lv0 = Int_val(v0);
	LOAD_FUNCTION(glDisableVertexAttribArray);
	(*stub_glDisableVertexAttribArray)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDrawArrays,(GLenum, GLint, GLsizei),void);
value glstub_glDrawArrays(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLsizei lv2 = Int_val(v2);
	LOAD_FUNCTION(glDrawArrays);
	(*stub_glDrawArrays)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glDrawElements,(GLenum, GLsizei, GLenum, GLvoid*),void);
value glstub_glDrawElements(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	GLvoid* lv3 = (Is_long(v3) ? (GLvoid*)Long_val(v3) : ((Tag_val(v3) == String_tag)? (String_val(v3)) : (Data_bigarray_val(v3))));
	LOAD_FUNCTION(glDrawElements);
	(*stub_glDrawElements)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glEnable,(GLenum),void);
value glstub_glEnable(value v0)
{
	CAMLparam1(v0);
	GLenum lv0 = Int_val(v0);
	LOAD_FUNCTION(glEnable);
	(*stub_glEnable)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glEnableVertexAttribArray,(GLuint),void);
value glstub_glEnableVertexAttribArray(value v0)
{
	CAMLparam1(v0);
	GLuint lv0 = Int_val(v0);
	LOAD_FUNCTION(glEnableVertexAttribArray);
	(*stub_glEnableVertexAttribArray)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glFinish,(void),void);
value glstub_glFinish(value v0)
{
	CAMLparam1(v0);
	LOAD_FUNCTION(glFinish);
	(*stub_glFinish)();
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glFlush,(void),void);
value glstub_glFlush(value v0)
{
	CAMLparam1(v0);
	LOAD_FUNCTION(glFlush);
	(*stub_glFlush)();
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glFramebufferRenderbuffer,(GLenum, GLenum, GLenum, GLuint),void);
value glstub_glFramebufferRenderbuffer(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	GLuint lv3 = Int_val(v3);
	LOAD_FUNCTION(glFramebufferRenderbuffer);
	(*stub_glFramebufferRenderbuffer)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glFramebufferTexture2D,(GLenum, GLenum, GLenum, GLuint, GLint),void);
value glstub_glFramebufferTexture2D(value v0, value v1, value v2, value v3, value v4)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	GLuint lv3 = Int_val(v3);
	GLint lv4 = Int_val(v4);
	LOAD_FUNCTION(glFramebufferTexture2D);
	(*stub_glFramebufferTexture2D)(lv0, lv1, lv2, lv3, lv4);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glFrontFace,(GLenum),void);
value glstub_glFrontFace(value v0)
{
	CAMLparam1(v0);
	GLenum lv0 = Int_val(v0);
	LOAD_FUNCTION(glFrontFace);
	(*stub_glFrontFace)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGenBuffers,(GLsizei, GLuint*),void);
value glstub_glGenBuffers(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLsizei lv0 = Int_val(v0);
	GLuint* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glGenBuffers);
	(*stub_glGenBuffers)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGenFramebuffers,(GLsizei, GLuint*),void);
value glstub_glGenFramebuffers(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLsizei lv0 = Int_val(v0);
	GLuint* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glGenFramebuffers);
	(*stub_glGenFramebuffers)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGenRenderbuffers,(GLsizei, GLuint*),void);
value glstub_glGenRenderbuffers(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLsizei lv0 = Int_val(v0);
	GLuint* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glGenRenderbuffers);
	(*stub_glGenRenderbuffers)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGenTextures,(GLsizei, GLuint*),void);
value glstub_glGenTextures(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLsizei lv0 = Int_val(v0);
	GLuint* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glGenTextures);
	(*stub_glGenTextures)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGenerateMipmap,(GLenum),void);
value glstub_glGenerateMipmap(value v0)
{
	CAMLparam1(v0);
	GLenum lv0 = Int_val(v0);
	LOAD_FUNCTION(glGenerateMipmap);
	(*stub_glGenerateMipmap)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetActiveAttrib,(GLuint, GLuint, GLsizei, GLsizei*, GLint*, GLenum*, GLchar*),void);
value glstub_glGetActiveAttrib(value v0, value v1, value v2, value v3, value v4, value v5, value v6)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam2(v5, v6);
	GLuint lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	GLsizei lv2 = Int_val(v2);
	GLsizei* lv3 = Data_bigarray_val(v3);
	GLint* lv4 = Data_bigarray_val(v4);
	GLenum* lv5 = Data_bigarray_val(v5);
	GLchar* lv6 = String_val(v6);
	LOAD_FUNCTION(glGetActiveAttrib);
	(*stub_glGetActiveAttrib)(lv0, lv1, lv2, lv3, lv4, lv5, lv6);
	CAMLreturn(Val_unit);
}

value glstub_glGetActiveAttrib_byte(value * argv, int n)
{
	return glstub_glGetActiveAttrib(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

DECLARE_FUNCTION(glGetActiveUniform,(GLuint, GLuint, GLsizei, GLsizei*, GLint*, GLenum*, GLchar*),void);
value glstub_glGetActiveUniform(value v0, value v1, value v2, value v3, value v4, value v5, value v6)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam2(v5, v6);
	GLuint lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	GLsizei lv2 = Int_val(v2);
	GLsizei* lv3 = Data_bigarray_val(v3);
	GLint* lv4 = Data_bigarray_val(v4);
	GLenum* lv5 = Data_bigarray_val(v5);
	GLchar* lv6 = String_val(v6);
	LOAD_FUNCTION(glGetActiveUniform);
	(*stub_glGetActiveUniform)(lv0, lv1, lv2, lv3, lv4, lv5, lv6);
	CAMLreturn(Val_unit);
}

value glstub_glGetActiveUniform_byte(value * argv, int n)
{
	return glstub_glGetActiveUniform(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

DECLARE_FUNCTION(glGetAttachedShaders,(GLuint, GLsizei, GLsizei*, GLuint*),void);
value glstub_glGetAttachedShaders(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLuint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLsizei* lv2 = Data_bigarray_val(v2);
	GLuint* lv3 = Data_bigarray_val(v3);
	LOAD_FUNCTION(glGetAttachedShaders);
	(*stub_glGetAttachedShaders)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetAttribLocation,(GLuint, GLchar*),GLint);
value glstub_glGetAttribLocation(value v0, value v1)
{
	CAMLparam2(v0, v1);
	CAMLlocal1(result);
	GLuint lv0 = Int_val(v0);
	GLchar* lv1 = String_val(v1);
	GLint ret;
	LOAD_FUNCTION(glGetAttribLocation);
	ret = (*stub_glGetAttribLocation)(lv0, lv1);
	result = Val_int(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glGetBooleanv,(GLenum, GLboolean*),void);
value glstub_glGetBooleanv(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLboolean* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glGetBooleanv);
	(*stub_glGetBooleanv)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetBufferParameteriv,(GLenum, GLenum, GLint*),void);
value glstub_glGetBufferParameteriv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetBufferParameteriv);
	(*stub_glGetBufferParameteriv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetError,(void),GLenum);
value glstub_glGetError(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLenum ret;
	LOAD_FUNCTION(glGetError);
	ret = (*stub_glGetError)();
	result = Val_int(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glGetFloatv,(GLenum, GLfloat*),void);
value glstub_glGetFloatv(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLfloat* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glGetFloatv);
	(*stub_glGetFloatv)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetFramebufferAttachmentParameteriv,(GLenum, GLenum, GLenum, GLint*),void);
value glstub_glGetFramebufferAttachmentParameteriv(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	GLint* lv3 = Data_bigarray_val(v3);
	LOAD_FUNCTION(glGetFramebufferAttachmentParameteriv);
	(*stub_glGetFramebufferAttachmentParameteriv)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetIntegerv,(GLenum, GLint*),void);
value glstub_glGetIntegerv(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLint* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glGetIntegerv);
	(*stub_glGetIntegerv)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetProgramInfoLog,(GLuint, GLsizei, GLsizei*, GLchar*),void);
value glstub_glGetProgramInfoLog(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLuint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLsizei* lv2 = Data_bigarray_val(v2);
	GLchar* lv3 = String_val(v3);
	LOAD_FUNCTION(glGetProgramInfoLog);
	(*stub_glGetProgramInfoLog)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetProgramiv,(GLuint, GLenum, GLint*),void);
value glstub_glGetProgramiv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLuint lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetProgramiv);
	(*stub_glGetProgramiv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetRenderbufferParameteriv,(GLenum, GLenum, GLint*),void);
value glstub_glGetRenderbufferParameteriv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetRenderbufferParameteriv);
	(*stub_glGetRenderbufferParameteriv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetShaderInfoLog,(GLuint, GLsizei, GLsizei*, GLchar*),void);
value glstub_glGetShaderInfoLog(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLuint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLsizei* lv2 = Data_bigarray_val(v2);
	GLchar* lv3 = String_val(v3);
	LOAD_FUNCTION(glGetShaderInfoLog);
	(*stub_glGetShaderInfoLog)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetShaderPrecisionFormat,(GLenum, GLenum, GLint*, GLint*),void);
value glstub_glGetShaderPrecisionFormat(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	GLint* lv3 = Data_bigarray_val(v3);
	LOAD_FUNCTION(glGetShaderPrecisionFormat);
	(*stub_glGetShaderPrecisionFormat)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetShaderSource,(GLuint, GLsizei, GLsizei*, GLchar*),void);
value glstub_glGetShaderSource(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLuint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLsizei* lv2 = Data_bigarray_val(v2);
	GLchar* lv3 = String_val(v3);
	LOAD_FUNCTION(glGetShaderSource);
	(*stub_glGetShaderSource)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetShaderiv,(GLuint, GLenum, GLint*),void);
value glstub_glGetShaderiv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLuint lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetShaderiv);
	(*stub_glGetShaderiv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetTexParameterfv,(GLenum, GLenum, GLfloat*),void);
value glstub_glGetTexParameterfv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLfloat* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetTexParameterfv);
	(*stub_glGetTexParameterfv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetTexParameteriv,(GLenum, GLenum, GLint*),void);
value glstub_glGetTexParameteriv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetTexParameteriv);
	(*stub_glGetTexParameteriv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetUniformLocation,(GLuint, GLchar*),GLint);
value glstub_glGetUniformLocation(value v0, value v1)
{
	CAMLparam2(v0, v1);
	CAMLlocal1(result);
	GLuint lv0 = Int_val(v0);
	GLchar* lv1 = String_val(v1);
	GLint ret;
	LOAD_FUNCTION(glGetUniformLocation);
	ret = (*stub_glGetUniformLocation)(lv0, lv1);
	result = Val_int(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glGetUniformfv,(GLuint, GLint, GLfloat*),void);
value glstub_glGetUniformfv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLuint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLfloat* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetUniformfv);
	(*stub_glGetUniformfv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetUniformiv,(GLuint, GLint, GLint*),void);
value glstub_glGetUniformiv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLuint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetUniformiv);
	(*stub_glGetUniformiv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetVertexAttribPointerv,(GLuint, GLenum, GLvoid**),void);
value glstub_glGetVertexAttribPointerv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLuint lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLvoid** lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetVertexAttribPointerv);
	(*stub_glGetVertexAttribPointerv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetVertexAttribfv,(GLuint, GLenum, GLfloat*),void);
value glstub_glGetVertexAttribfv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLuint lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLfloat* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetVertexAttribfv);
	(*stub_glGetVertexAttribfv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glGetVertexAttribiv,(GLuint, GLenum, GLint*),void);
value glstub_glGetVertexAttribiv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLuint lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glGetVertexAttribiv);
	(*stub_glGetVertexAttribiv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glHint,(GLenum, GLenum),void);
value glstub_glHint(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	LOAD_FUNCTION(glHint);
	(*stub_glHint)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glIsBuffer,(GLuint),GLboolean);
value glstub_glIsBuffer(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLuint lv0 = Int_val(v0);
	GLboolean ret;
	LOAD_FUNCTION(glIsBuffer);
	ret = (*stub_glIsBuffer)(lv0);
	result = Val_bool(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glIsEnabled,(GLenum),GLboolean);
value glstub_glIsEnabled(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLenum lv0 = Int_val(v0);
	GLboolean ret;
	LOAD_FUNCTION(glIsEnabled);
	ret = (*stub_glIsEnabled)(lv0);
	result = Val_bool(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glIsFramebuffer,(GLuint),GLboolean);
value glstub_glIsFramebuffer(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLuint lv0 = Int_val(v0);
	GLboolean ret;
	LOAD_FUNCTION(glIsFramebuffer);
	ret = (*stub_glIsFramebuffer)(lv0);
	result = Val_bool(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glIsProgram,(GLuint),GLboolean);
value glstub_glIsProgram(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLuint lv0 = Int_val(v0);
	GLboolean ret;
	LOAD_FUNCTION(glIsProgram);
	ret = (*stub_glIsProgram)(lv0);
	result = Val_bool(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glIsRenderbuffer,(GLuint),GLboolean);
value glstub_glIsRenderbuffer(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLuint lv0 = Int_val(v0);
	GLboolean ret;
	LOAD_FUNCTION(glIsRenderbuffer);
	ret = (*stub_glIsRenderbuffer)(lv0);
	result = Val_bool(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glIsShader,(GLuint),GLboolean);
value glstub_glIsShader(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLuint lv0 = Int_val(v0);
	GLboolean ret;
	LOAD_FUNCTION(glIsShader);
	ret = (*stub_glIsShader)(lv0);
	result = Val_bool(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glIsTexture,(GLuint),GLboolean);
value glstub_glIsTexture(value v0)
{
	CAMLparam1(v0);
	CAMLlocal1(result);
	GLuint lv0 = Int_val(v0);
	GLboolean ret;
	LOAD_FUNCTION(glIsTexture);
	ret = (*stub_glIsTexture)(lv0);
	result = Val_bool(ret);
	CAMLreturn(result);
}

DECLARE_FUNCTION(glLineWidth,(GLfloat),void);
value glstub_glLineWidth(value v0)
{
	CAMLparam1(v0);
	GLfloat lv0 = Double_val(v0);
	LOAD_FUNCTION(glLineWidth);
	(*stub_glLineWidth)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glLinkProgram,(GLuint),void);
value glstub_glLinkProgram(value v0)
{
	CAMLparam1(v0);
	GLuint lv0 = Int_val(v0);
	LOAD_FUNCTION(glLinkProgram);
	(*stub_glLinkProgram)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glPixelStorei,(GLenum, GLint),void);
value glstub_glPixelStorei(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	LOAD_FUNCTION(glPixelStorei);
	(*stub_glPixelStorei)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glPolygonOffset,(GLfloat, GLfloat),void);
value glstub_glPolygonOffset(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLfloat lv0 = Double_val(v0);
	GLfloat lv1 = Double_val(v1);
	LOAD_FUNCTION(glPolygonOffset);
	(*stub_glPolygonOffset)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glReadPixels,(GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, GLvoid*),void);
value glstub_glReadPixels(value v0, value v1, value v2, value v3, value v4, value v5, value v6)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam2(v5, v6);
	GLint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLsizei lv2 = Int_val(v2);
	GLsizei lv3 = Int_val(v3);
	GLenum lv4 = Int_val(v4);
	GLenum lv5 = Int_val(v5);
	GLvoid* lv6 = (Is_long(v6) ? (GLvoid*)Long_val(v6) : ((Tag_val(v6) == String_tag)? (String_val(v6)) : (Data_bigarray_val(v6))));
	LOAD_FUNCTION(glReadPixels);
	(*stub_glReadPixels)(lv0, lv1, lv2, lv3, lv4, lv5, lv6);
	CAMLreturn(Val_unit);
}

value glstub_glReadPixels_byte(value * argv, int n)
{
	return glstub_glReadPixels(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

DECLARE_FUNCTION(glReleaseShaderCompiler,(void),void);
value glstub_glReleaseShaderCompiler(value v0)
{
	CAMLparam1(v0);
	LOAD_FUNCTION(glReleaseShaderCompiler);
	(*stub_glReleaseShaderCompiler)();
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glRenderbufferStorage,(GLenum, GLenum, GLsizei, GLsizei),void);
value glstub_glRenderbufferStorage(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLsizei lv2 = Int_val(v2);
	GLsizei lv3 = Int_val(v3);
	LOAD_FUNCTION(glRenderbufferStorage);
	(*stub_glRenderbufferStorage)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glSampleCoverage,(GLclampf, GLboolean),void);
value glstub_glSampleCoverage(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLclampf lv0 = Double_val(v0);
	GLboolean lv1 = Bool_val(v1);
	LOAD_FUNCTION(glSampleCoverage);
	(*stub_glSampleCoverage)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glScissor,(GLint, GLint, GLsizei, GLsizei),void);
value glstub_glScissor(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLsizei lv2 = Int_val(v2);
	GLsizei lv3 = Int_val(v3);
	LOAD_FUNCTION(glScissor);
	(*stub_glScissor)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glShaderBinary,(GLsizei, GLuint*, GLenum, GLvoid*, GLsizei),void);
value glstub_glShaderBinary(value v0, value v1, value v2, value v3, value v4)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	GLsizei lv0 = Int_val(v0);
	GLuint* lv1 = Data_bigarray_val(v1);
	GLenum lv2 = Int_val(v2);
	GLvoid* lv3 = (Is_long(v3) ? (GLvoid*)Long_val(v3) : ((Tag_val(v3) == String_tag)? (String_val(v3)) : (Data_bigarray_val(v3))));
	GLsizei lv4 = Int_val(v4);
	LOAD_FUNCTION(glShaderBinary);
	(*stub_glShaderBinary)(lv0, lv1, lv2, lv3, lv4);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glShaderSource,(GLuint, GLsizei, GLchar**, GLint*),void);
value glstub_glShaderSource(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLuint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLchar** lv2 = (GLchar** )(v2);
	GLint* lv3 = Data_bigarray_val(v3);
	LOAD_FUNCTION(glShaderSource);
	(*stub_glShaderSource)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glStencilFunc,(GLenum, GLint, GLuint),void);
value glstub_glStencilFunc(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLuint lv2 = Int_val(v2);
	LOAD_FUNCTION(glStencilFunc);
	(*stub_glStencilFunc)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glStencilFuncSeparate,(GLenum, GLenum, GLint, GLuint),void);
value glstub_glStencilFuncSeparate(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint lv2 = Int_val(v2);
	GLuint lv3 = Int_val(v3);
	LOAD_FUNCTION(glStencilFuncSeparate);
	(*stub_glStencilFuncSeparate)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glStencilMask,(GLuint),void);
value glstub_glStencilMask(value v0)
{
	CAMLparam1(v0);
	GLuint lv0 = Int_val(v0);
	LOAD_FUNCTION(glStencilMask);
	(*stub_glStencilMask)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glStencilMaskSeparate,(GLenum, GLuint),void);
value glstub_glStencilMaskSeparate(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLenum lv0 = Int_val(v0);
	GLuint lv1 = Int_val(v1);
	LOAD_FUNCTION(glStencilMaskSeparate);
	(*stub_glStencilMaskSeparate)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glStencilOp,(GLenum, GLenum, GLenum),void);
value glstub_glStencilOp(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	LOAD_FUNCTION(glStencilOp);
	(*stub_glStencilOp)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glStencilOpSeparate,(GLenum, GLenum, GLenum, GLenum),void);
value glstub_glStencilOpSeparate(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	GLenum lv3 = Int_val(v3);
	LOAD_FUNCTION(glStencilOpSeparate);
	(*stub_glStencilOpSeparate)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glTexImage2D,(GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, GLvoid*),void);
value glstub_glTexImage2D(value v0, value v1, value v2, value v3, value v4, value v5, value v6, value v7, value v8)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam4(v5, v6, v7, v8);
	GLenum lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLint lv2 = Int_val(v2);
	GLsizei lv3 = Int_val(v3);
	GLsizei lv4 = Int_val(v4);
	GLint lv5 = Int_val(v5);
	GLenum lv6 = Int_val(v6);
	GLenum lv7 = Int_val(v7);
	GLvoid* lv8 = (Is_long(v8) ? (GLvoid*)Long_val(v8) : ((Tag_val(v8) == String_tag)? (String_val(v8)) : (Data_bigarray_val(v8))));
	LOAD_FUNCTION(glTexImage2D);
	(*stub_glTexImage2D)(lv0, lv1, lv2, lv3, lv4, lv5, lv6, lv7, lv8);
	CAMLreturn(Val_unit);
}

value glstub_glTexImage2D_byte(value * argv, int n)
{
	return glstub_glTexImage2D(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

DECLARE_FUNCTION(glTexParameterf,(GLenum, GLenum, GLfloat),void);
value glstub_glTexParameterf(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLfloat lv2 = Double_val(v2);
	LOAD_FUNCTION(glTexParameterf);
	(*stub_glTexParameterf)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glTexParameterfv,(GLenum, GLenum, GLfloat*),void);
value glstub_glTexParameterfv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLfloat* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glTexParameterfv);
	(*stub_glTexParameterfv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glTexParameteri,(GLenum, GLenum, GLint),void);
value glstub_glTexParameteri(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint lv2 = Int_val(v2);
	LOAD_FUNCTION(glTexParameteri);
	(*stub_glTexParameteri)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glTexParameteriv,(GLenum, GLenum, GLint*),void);
value glstub_glTexParameteriv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLenum lv0 = Int_val(v0);
	GLenum lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glTexParameteriv);
	(*stub_glTexParameteriv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glTexSubImage2D,(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, GLvoid*),void);
value glstub_glTexSubImage2D(value v0, value v1, value v2, value v3, value v4, value v5, value v6, value v7, value v8)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam4(v5, v6, v7, v8);
	GLenum lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLint lv2 = Int_val(v2);
	GLint lv3 = Int_val(v3);
	GLsizei lv4 = Int_val(v4);
	GLsizei lv5 = Int_val(v5);
	GLenum lv6 = Int_val(v6);
	GLenum lv7 = Int_val(v7);
	GLvoid* lv8 = (Is_long(v8) ? (GLvoid*)Long_val(v8) : ((Tag_val(v8) == String_tag)? (String_val(v8)) : (Data_bigarray_val(v8))));
	LOAD_FUNCTION(glTexSubImage2D);
	(*stub_glTexSubImage2D)(lv0, lv1, lv2, lv3, lv4, lv5, lv6, lv7, lv8);
	CAMLreturn(Val_unit);
}

value glstub_glTexSubImage2D_byte(value * argv, int n)
{
	return glstub_glTexSubImage2D(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

DECLARE_FUNCTION(glUniform1f,(GLint, GLfloat),void);
value glstub_glUniform1f(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLint lv0 = Int_val(v0);
	GLfloat lv1 = Double_val(v1);
	LOAD_FUNCTION(glUniform1f);
	(*stub_glUniform1f)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform1fv,(GLint, GLsizei, GLfloat*),void);
value glstub_glUniform1fv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLfloat* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glUniform1fv);
	(*stub_glUniform1fv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform1i,(GLint, GLint),void);
value glstub_glUniform1i(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	LOAD_FUNCTION(glUniform1i);
	(*stub_glUniform1i)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform1iv,(GLint, GLsizei, GLint*),void);
value glstub_glUniform1iv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glUniform1iv);
	(*stub_glUniform1iv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform2f,(GLint, GLfloat, GLfloat),void);
value glstub_glUniform2f(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLfloat lv1 = Double_val(v1);
	GLfloat lv2 = Double_val(v2);
	LOAD_FUNCTION(glUniform2f);
	(*stub_glUniform2f)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform2fv,(GLint, GLsizei, GLfloat*),void);
value glstub_glUniform2fv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLfloat* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glUniform2fv);
	(*stub_glUniform2fv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform2i,(GLint, GLint, GLint),void);
value glstub_glUniform2i(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLint lv2 = Int_val(v2);
	LOAD_FUNCTION(glUniform2i);
	(*stub_glUniform2i)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform2iv,(GLint, GLsizei, GLint*),void);
value glstub_glUniform2iv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glUniform2iv);
	(*stub_glUniform2iv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform3f,(GLint, GLfloat, GLfloat, GLfloat),void);
value glstub_glUniform3f(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLint lv0 = Int_val(v0);
	GLfloat lv1 = Double_val(v1);
	GLfloat lv2 = Double_val(v2);
	GLfloat lv3 = Double_val(v3);
	LOAD_FUNCTION(glUniform3f);
	(*stub_glUniform3f)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform3fv,(GLint, GLsizei, GLfloat*),void);
value glstub_glUniform3fv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLfloat* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glUniform3fv);
	(*stub_glUniform3fv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform3i,(GLint, GLint, GLint, GLint),void);
value glstub_glUniform3i(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLint lv2 = Int_val(v2);
	GLint lv3 = Int_val(v3);
	LOAD_FUNCTION(glUniform3i);
	(*stub_glUniform3i)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform3iv,(GLint, GLsizei, GLint*),void);
value glstub_glUniform3iv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glUniform3iv);
	(*stub_glUniform3iv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform4f,(GLint, GLfloat, GLfloat, GLfloat, GLfloat),void);
value glstub_glUniform4f(value v0, value v1, value v2, value v3, value v4)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	GLint lv0 = Int_val(v0);
	GLfloat lv1 = Double_val(v1);
	GLfloat lv2 = Double_val(v2);
	GLfloat lv3 = Double_val(v3);
	GLfloat lv4 = Double_val(v4);
	LOAD_FUNCTION(glUniform4f);
	(*stub_glUniform4f)(lv0, lv1, lv2, lv3, lv4);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform4fv,(GLint, GLsizei, GLfloat*),void);
value glstub_glUniform4fv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLfloat* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glUniform4fv);
	(*stub_glUniform4fv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform4i,(GLint, GLint, GLint, GLint, GLint),void);
value glstub_glUniform4i(value v0, value v1, value v2, value v3, value v4)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	GLint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLint lv2 = Int_val(v2);
	GLint lv3 = Int_val(v3);
	GLint lv4 = Int_val(v4);
	LOAD_FUNCTION(glUniform4i);
	(*stub_glUniform4i)(lv0, lv1, lv2, lv3, lv4);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniform4iv,(GLint, GLsizei, GLint*),void);
value glstub_glUniform4iv(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLint* lv2 = Data_bigarray_val(v2);
	LOAD_FUNCTION(glUniform4iv);
	(*stub_glUniform4iv)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniformMatrix2fv,(GLint, GLsizei, GLboolean, GLfloat*),void);
value glstub_glUniformMatrix2fv(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLboolean lv2 = Bool_val(v2);
	GLfloat* lv3 = Data_bigarray_val(v3);
	LOAD_FUNCTION(glUniformMatrix2fv);
	(*stub_glUniformMatrix2fv)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniformMatrix3fv,(GLint, GLsizei, GLboolean, GLfloat*),void);
value glstub_glUniformMatrix3fv(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLboolean lv2 = Bool_val(v2);
	GLfloat* lv3 = Data_bigarray_val(v3);
	LOAD_FUNCTION(glUniformMatrix3fv);
	(*stub_glUniformMatrix3fv)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUniformMatrix4fv,(GLint, GLsizei, GLboolean, GLfloat*),void);
value glstub_glUniformMatrix4fv(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLint lv0 = Int_val(v0);
	GLsizei lv1 = Int_val(v1);
	GLboolean lv2 = Bool_val(v2);
	GLfloat* lv3 = Data_bigarray_val(v3);
	LOAD_FUNCTION(glUniformMatrix4fv);
	(*stub_glUniformMatrix4fv)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glUseProgram,(GLuint),void);
value glstub_glUseProgram(value v0)
{
	CAMLparam1(v0);
	GLuint lv0 = Int_val(v0);
	LOAD_FUNCTION(glUseProgram);
	(*stub_glUseProgram)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glValidateProgram,(GLuint),void);
value glstub_glValidateProgram(value v0)
{
	CAMLparam1(v0);
	GLuint lv0 = Int_val(v0);
	LOAD_FUNCTION(glValidateProgram);
	(*stub_glValidateProgram)(lv0);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glVertexAttrib1f,(GLuint, GLfloat),void);
value glstub_glVertexAttrib1f(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLuint lv0 = Int_val(v0);
	GLfloat lv1 = Double_val(v1);
	LOAD_FUNCTION(glVertexAttrib1f);
	(*stub_glVertexAttrib1f)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glVertexAttrib1fv,(GLuint, GLfloat*),void);
value glstub_glVertexAttrib1fv(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLuint lv0 = Int_val(v0);
	GLfloat* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glVertexAttrib1fv);
	(*stub_glVertexAttrib1fv)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glVertexAttrib2f,(GLuint, GLfloat, GLfloat),void);
value glstub_glVertexAttrib2f(value v0, value v1, value v2)
{
	CAMLparam3(v0, v1, v2);
	GLuint lv0 = Int_val(v0);
	GLfloat lv1 = Double_val(v1);
	GLfloat lv2 = Double_val(v2);
	LOAD_FUNCTION(glVertexAttrib2f);
	(*stub_glVertexAttrib2f)(lv0, lv1, lv2);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glVertexAttrib2fv,(GLuint, GLfloat*),void);
value glstub_glVertexAttrib2fv(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLuint lv0 = Int_val(v0);
	GLfloat* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glVertexAttrib2fv);
	(*stub_glVertexAttrib2fv)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glVertexAttrib3f,(GLuint, GLfloat, GLfloat, GLfloat),void);
value glstub_glVertexAttrib3f(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLuint lv0 = Int_val(v0);
	GLfloat lv1 = Double_val(v1);
	GLfloat lv2 = Double_val(v2);
	GLfloat lv3 = Double_val(v3);
	LOAD_FUNCTION(glVertexAttrib3f);
	(*stub_glVertexAttrib3f)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glVertexAttrib3fv,(GLuint, GLfloat*),void);
value glstub_glVertexAttrib3fv(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLuint lv0 = Int_val(v0);
	GLfloat* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glVertexAttrib3fv);
	(*stub_glVertexAttrib3fv)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glVertexAttrib4f,(GLuint, GLfloat, GLfloat, GLfloat, GLfloat),void);
value glstub_glVertexAttrib4f(value v0, value v1, value v2, value v3, value v4)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	GLuint lv0 = Int_val(v0);
	GLfloat lv1 = Double_val(v1);
	GLfloat lv2 = Double_val(v2);
	GLfloat lv3 = Double_val(v3);
	GLfloat lv4 = Double_val(v4);
	LOAD_FUNCTION(glVertexAttrib4f);
	(*stub_glVertexAttrib4f)(lv0, lv1, lv2, lv3, lv4);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glVertexAttrib4fv,(GLuint, GLfloat*),void);
value glstub_glVertexAttrib4fv(value v0, value v1)
{
	CAMLparam2(v0, v1);
	GLuint lv0 = Int_val(v0);
	GLfloat* lv1 = Data_bigarray_val(v1);
	LOAD_FUNCTION(glVertexAttrib4fv);
	(*stub_glVertexAttrib4fv)(lv0, lv1);
	CAMLreturn(Val_unit);
}

DECLARE_FUNCTION(glVertexAttribPointer,(GLuint, GLint, GLenum, GLboolean, GLsizei, GLvoid*),void);
value glstub_glVertexAttribPointer(value v0, value v1, value v2, value v3, value v4, value v5)
{
	CAMLparam5(v0, v1, v2, v3, v4);
	CAMLxparam1(v5);
	GLuint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLenum lv2 = Int_val(v2);
	GLboolean lv3 = Bool_val(v3);
	GLsizei lv4 = Int_val(v4);
	GLvoid* lv5 = (Is_long(v5) ? (GLvoid*)Long_val(v5) : ((Tag_val(v5) == String_tag)? (String_val(v5)) : (Data_bigarray_val(v5))));
	LOAD_FUNCTION(glVertexAttribPointer);
	(*stub_glVertexAttribPointer)(lv0, lv1, lv2, lv3, lv4, lv5);
	CAMLreturn(Val_unit);
}

value glstub_glVertexAttribPointer_byte(value * argv, int n)
{
	return glstub_glVertexAttribPointer(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

DECLARE_FUNCTION(glViewport,(GLint, GLint, GLsizei, GLsizei),void);
value glstub_glViewport(value v0, value v1, value v2, value v3)
{
	CAMLparam4(v0, v1, v2, v3);
	GLint lv0 = Int_val(v0);
	GLint lv1 = Int_val(v1);
	GLsizei lv2 = Int_val(v2);
	GLsizei lv3 = Int_val(v3);
	LOAD_FUNCTION(glViewport);
	(*stub_glViewport)(lv0, lv1, lv2, lv3);
	CAMLreturn(Val_unit);
}

