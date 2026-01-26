# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false
LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libexynosutils libexynosv4l2

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../include \
	$(TOP)/hardware/samsung_slsi-cm/exynos/include \
	$(TOP)/hardware/samsung_slsi-cm/exynos/libexynosutils

ifeq ($(filter 3.10, $(TARGET_LINUX_KERNEL_VERSION)), 3.10)
LOCAL_C_INCLUDES += $(TOP)/hardware/samsung_slsi-cm/exynos/kernel-3.10-headers
else
ifeq ($(filter 3.4, $(TARGET_LINUX_KERNEL_VERSION)), 3.4)
LOCAL_C_INCLUDES += $(TOP)/hardware/samsung_slsi-cm/exynos/kernel-3.4-headers
endif
endif

LOCAL_SRC_FILES := exynos_blender.cpp exynos_blender_obj.cpp libg2d.cpp

LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := libexynosg2d
include $(BUILD_SHARED_LIBRARY)
